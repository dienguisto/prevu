class Ordonnance < ActiveRecord::Base
  include ActsAsServices

  default_scope {order('created_at desc')}
  belongs_to :adherent
  belongs_to :pharmacy

  has_many :detail_ordonnances, dependent: :destroy
  has_many :medicaments, through: :detail_ordonnances

  accepts_nested_attributes_for :detail_ordonnances,
      allow_destroy: true, reject_if: :all_blank

  validates :adherent_id, :pharmacy_id,
            presence: true, on: :create

  def reset_prix_total!
    self.update(montant_total: get_total)
  end

  def get_total
    detail_ordonnances.reduce(0) { |s, d| s + d.prix_unitaire * d.quantite }
  end

  def get_total_ticket_moderateur
    ticket_moderateur = adherent.souscriptions.en_cours.last.formule.ticket_moderateur
    ticket_moderateur * get_total / 100
  end

  def get_total_pris_en_charge
    ticket_moderateur = adherent.souscriptions.en_cours.last.formule.ticket_moderateur
    (100 - ticket_moderateur) * get_total / 100
  end
end

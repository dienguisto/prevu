class Ordonnance < ActiveRecord::Base
  belongs_to :adherent
  belongs_to :pharmacy

  has_many :detail_ordonnances, dependent: :destroy
  has_many :medicaments, through: :detail_ordonnances

  accepts_nested_attributes_for :detail_ordonnances,
      allow_destroy: true, reject_if: :all_blank

  validates :adherent_id, :pharmacy_id,
            presence: true, on: :create

  def reset_prix_total!
    self.update(prix_total: get_total)
  end

  def get_total
    detail_ordonnances.reduce(0) { |s, d| s + d.prix_unitaire * d.quantite }
  end
end
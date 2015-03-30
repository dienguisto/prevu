class Souscription < ActiveRecord::Base
  default_scope {order('created_at desc')}

  include Activable
  belongs_to :adherent
  belongs_to :formule
  has_many :cotisations

  validates :formule, presence: true
  validates :date_expiration, presence: true, if: 'paye?'

  scope :en_cours, -> { where('date_expiration >= ?', Time.now) }

  before_create :set_date_paiement

  def activate!
    update(actif: true, date_activation: Time.now) if date_expiration >= Time.now
  end

  def payer!
    update(paye: true, date_paiement: Time.now, date_expiration: Time.now + 1.year)
  end

  def set_date_paiement
    self.date_paiement = Time.now if paye?
  end

  def generate_cotisation!
    date_dernier_paiement = cotisations.empty? ? date_paiement : cotisations.order('pour_la_date desc').first.pour_la_date
    date_prochain_paiement = date_dernier_paiement + formule.interval_paiement
    if date_prochain_paiement > Time.now
      return nil
    end
    self.cotisations.create(adherent: adherent,
                            montant: formule.montant_cotisation,
                            pour_la_date: date_prochain_paiement)
  end
end

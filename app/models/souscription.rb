class Souscription < ActiveRecord::Base
  default_scope {order('created_at desc')}

  include Activable
  belongs_to :adherent
  belongs_to :formule

  validates :formule, presence: true
  validates :date_expiration, presence: true, if: 'paye?'

  scope :en_cours, -> { where('date_expiration >= ?', Time.now) }

  def activate!
    update(actif: true, date_activation: Time.now)
  end

  def payer!
    update(paye: true, date_paiement: Time.now, date_expiration: Time.now + 1.year)
  end
end

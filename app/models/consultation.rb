class Consultation < ActiveRecord::Base
  belongs_to :type_acte_medical
  belongs_to :adherent
  belongs_to :formation_sanitaire

  validates :description, :montant, :type_acte_medical_id, :formation_sanitaire_id, :adherent_id,
            presence: true
  validates :montant, numericality: {greater_than: 0}
end

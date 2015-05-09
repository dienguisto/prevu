class Consultation < ActiveRecord::Base
  include ActsAsServices

  belongs_to :type_acte_medical
  belongs_to :adherent
  belongs_to :formation_sanitaire
  belongs_to :origine, class_name: FormationSanitaire, foreign_key: :origine_id

  validates :description, :montant_total, :type_acte_medical_id, :formation_sanitaire_id, :adherent_id,
            presence: true
  validates :montant_total, numericality: {greater_than: 0}
end

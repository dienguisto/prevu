class TypeActeMedical < ActiveRecord::Base
  belongs_to :categorie_acte_medical
  has_many :consultations

  validates :nom, presence: true
  validates :categorie_acte_medical_id, presence: true
end

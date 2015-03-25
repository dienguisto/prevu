class TypeActeMedical < ActiveRecord::Base
  belongs_to :categorie_acte_medical
  has_many :consultations
end

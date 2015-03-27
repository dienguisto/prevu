class CategorieActeMedical < ActiveRecord::Base
  has_many :type_acte_medicals

  validates :nom,
            presence: true, uniqueness: true
end

class CategorieActeMedical < ActiveRecord::Base
  has_many :type_acte_medicals
end

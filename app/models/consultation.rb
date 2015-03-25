class Consultation < ActiveRecord::Base
  belongs_to :type_acte_medical
  belongs_to :adherent
  belongs_to :formation_sanitaire
end

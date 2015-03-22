class Medicament < ActiveRecord::Base
  has_many :detail_ordonnances
end

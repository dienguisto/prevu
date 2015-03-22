class DetailOrdonnance < ActiveRecord::Base
  belongs_to :medicament
  belongs_to :ordonnance

  #validates_presence_of :medicament_id
  #validates_presence_of :ordonnance_id
end

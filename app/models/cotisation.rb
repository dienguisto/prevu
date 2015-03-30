class Cotisation < ActiveRecord::Base
  default_scoped { order('pour_la_date DESC') }
  belongs_to :adherent
  belongs_to :souscription
end

class Cotisation < ActiveRecord::Base
  default_scoped { order('pour_la_date DESC') }
  belongs_to :adherent
  belongs_to :souscription

  scope :payes, -> { where(paye: true) }
  scope :non_payes, -> { where(paye: false) }
end

class FormationSanitaire < ActiveRecord::Base
  include ActsAsStructureSanitaire
  has_many :consultations
  NIVEAU = {
      n1: 0,
      n2: 1,
      n3: 2,
      cp: 3
  }
  enum niveau: NIVEAU
  validates :niveau, presence: true

  def title
    "Formation sanitaire - #{nom}"
  end
end
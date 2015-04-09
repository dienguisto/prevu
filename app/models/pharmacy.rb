class Pharmacy < ActiveRecord::Base
  include ActsAsStructureSanitaire

  has_many :ordonnances

  def title
    "Pharmacie - #{nom}"
  end
end

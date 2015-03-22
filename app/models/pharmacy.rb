class Pharmacy < ActiveRecord::Base
  include ActsAsStructureSanitaire

  def title
    "Pharmacie - #{nom}"
  end
end

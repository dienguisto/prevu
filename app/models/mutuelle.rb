class Mutuelle < ActiveRecord::Base
  include ActsAsStructureAssurance

  def title
    "Mutuelle - #{nom}"
  end
end

class MicroAssurance < ActiveRecord::Base
  include ActsAsStructureAssurance

  def title
    "Micro assurance - #{nom}"
  end
end

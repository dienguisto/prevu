class FormuleStructureSanitaire < ActiveRecord::Base
  include Activable

  belongs_to :formule
  belongs_to :structure_sanitaire

  validates :structure_sanitaire, uniqueness: {scope: :formule}
end

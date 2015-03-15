module ActsAsStructureSanitaire
  extend ActiveSupport::Concern

  included do
    has_one :structure_sanitaire, as: :structure, dependent: :destroy
    accepts_nested_attributes_for :structure_sanitaire

    validates :structure_sanitaire, presence: true
  end
end
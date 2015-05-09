module ActsAsStructureSanitaire
  extend ActiveSupport::Concern
  include ActsAsEntite

  included do
    has_one :structure_sanitaire, as: :structure, dependent: :destroy
    accepts_nested_attributes_for :structure_sanitaire

    validates :structure_sanitaire, presence: true

    delegate :nom, to: :structure_sanitaire
    delegate :adresse, to: :structure_sanitaire
  end
end
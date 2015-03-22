module ActsAsStructureAssurance
  extend ActiveSupport::Concern
  include ActsAsEntite

  included do
    has_one :structure_assurance, as: :structure, dependent: :destroy
    accepts_nested_attributes_for :structure_assurance

    validates :structure_assurance, presence: true

    delegate :nom, to: :structure_assurance
  end
end
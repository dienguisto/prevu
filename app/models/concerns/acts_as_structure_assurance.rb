module ActsAsStructureAssurance
  extend ActiveSupport::Concern

  included do
    has_one :structure_assurance, as: :structure, dependent: :destroy
    accepts_nested_attributes_for :structure_assurance

    validates :structure_assurance, presence: true
  end
end
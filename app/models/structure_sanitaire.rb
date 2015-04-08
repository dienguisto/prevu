class StructureSanitaire < ActiveRecord::Base
  include Activable
  include ActsAsContact

  has_attached_file :logo, styles: { medium: '300x300>', thumb: '100x100>'}
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  belongs_to :structure, polymorphic: true
  has_many :formule_structure_sanitaires
  has_many :formules, through: :formule_structure_sanitaires

  validates :nom, presence: true

  scope :type_pharmacies, -> { where(structure_type: 'Pharmacy') }
  scope :type_formation_sanitaires, -> { where(structure_type: 'FormationSanitaire') }
end

class Groupe < ActiveRecord::Base
  belongs_to :structure_assurance

  validates :nom, presence: true
end

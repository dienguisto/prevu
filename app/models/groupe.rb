class Groupe < ActiveRecord::Base
  belongs_to :structure_assurance
  has_many :affectation_aperitrices
  has_many :structure_aperitrices, through: :affectation_aperitrices

  validates :nom, presence: true
end

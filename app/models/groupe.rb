class Groupe < ActiveRecord::Base
  include ActsAsContact

  # has_many :affectation_aperitrices
  # has_many :structure_aperitrices, through: :affectation_aperitrices

  belongs_to :structure_aperitrice
  has_many :adherents

  validates :nom, presence: true, uniqueness: true
end

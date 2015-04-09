class Groupe < ActiveRecord::Base
  include ActsAsContact

  has_many :affectation_aperitrices
  has_many :structure_aperitrices, through: :affectation_aperitrices

  validates :nom, presence: true, uniqueness: true
end

class StructureAperitrice < ActiveRecord::Base
  include ActsAsEntite
  include ActsAsContact

  validates :nom, presence: true
  # has_many :affectation_aperitrices
  # has_many :groupes, through: :affectation_aperitrices

  has_many :groupes

  def title
    "Structure apéritrice - #{nom}"
  end
end

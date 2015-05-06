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

  def total_a_verser_pharmacies(date=nil)
    groupes.map{|g| g.total_a_verser_pharmacies(date)}.reduce(&:+)
  end

  def total_a_verser_structure_sanitaires(date=nil)
    groupes.map{|g| g.total_a_verser_structure_sanitaires(date)}.reduce(&:+)
  end

  def nombres_ordonnances(date=nil)
    groupes.map{|g| g.nombres_ordonnances(date)}.reduce(&:+)
  end

  def nombres_actes_medicaux(date=nil)
    groupes.map{|g| g.nombres_actes_medicaux(date)}.reduce(&:+)
  end
end

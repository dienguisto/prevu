class Ordonnance < ActiveRecord::Base
  belongs_to :adherent
  belongs_to :pharmacy

  has_many :detail_ordonnances, dependent: :destroy
  has_many :medicaments, through: :detail_ordonnances

  accepts_nested_attributes_for :detail_ordonnances,
      :allow_destroy => true

  #validates_presence_of :detail_ordonnances
end
class Ordonnance < ActiveRecord::Base
  belongs_to :adherent
  belongs_to :pharmacy

  has_many :detail_ordonnances, dependent: :destroy
  has_many :medicaments, through: :detail_ordonnances

  before_create :set_total
  accepts_nested_attributes_for :detail_ordonnances,
      :allow_destroy => true, :reject_if => :all_blank

  #validates_presence_of :detail_ordonnances

  private
    def set_total
      total = 0
      detail_ordonnances.each do |d|
        total += d.prix_unitaire* d.quantite
      end
      self.prix_total = total
    end
end
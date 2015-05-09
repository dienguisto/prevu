class Versement < ActiveRecord::Base
  belongs_to :compte
  belongs_to :mandataire
  belongs_to :structure_assurance

  after_create :update_compte!

  validates :montant, presence: true, numericality: {greater_than: 0}, confirmation: true
  # validates :mandataire, presence: true

  accepts_nested_attributes_for :mandataire, reject_if: :all_blank

  private

  def update_compte!
    compte.ajouter_versement!(montant)
  end
end

class DetailOrdonnance < ActiveRecord::Base
  belongs_to :medicament
  belongs_to :ordonnance

  after_save :reset_prix_total

  validates :prix_unitaire, :quantite, presence: true
  validates :prix_unitaire, numericality: {greater_than: 0}

  def reset_prix_total
    ordonnance.reset_prix_total!
  end
end

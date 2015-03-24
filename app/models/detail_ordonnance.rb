class DetailOrdonnance < ActiveRecord::Base
  belongs_to :medicament
  belongs_to :ordonnance

  after_save :reset_prix_total

  validates :prix_unitaire, :quantite, presence: true

  def reset_prix_total
    ordonnance.reset_prix_total!
  end
end

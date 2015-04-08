class Formule < ActiveRecord::Base
  PERIODES = {
      journaliere: 0,
      hebdomadaire: 1,
      mensuel: 2,
      trimestriel: 3,
      semestriel: 4,
      annuel: 5
  }

  enum periode: PERIODES

  belongs_to :structure_assurance
  has_many :souscriptions
  has_many :adherents, through: :souscriptions
  has_many :formule_structure_sanitaires
  has_many :structure_sanitaires, through: :formule_structure_sanitaires

  validates :structure_assurance_id, :nom, :periode, :montant_adhesion, :montant_cotisation, :occurrence_periode, presence: true
  validates :occurrence_periode, numericality: {greater_than: 0}

  def ajouter_structure_sanitaire!(structure_sanitaire)
    formule_structure_sanitaires.create(structure_sanitaire: structure_sanitaire, actif: true)
  end

  def interval_paiement
    if journaliere?
      return occurrence_periode.days
    end
    if hebdomadaire?
      return occurrence_periode.weeks
    end
    if mensuel?
      return occurrence_periode.months
    end
    if trimestriel?
      return (3 * occurrence_periode).months
    end
    if semestriel?
      return (6 * occurrence_periode).months
    end
    if annuel?
      return occurrence_periode.years
    end
  end
end

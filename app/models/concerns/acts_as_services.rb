module ActsAsServices
  extend ActiveSupport::Concern

  included do
    belongs_to :structure_assurance

    before_create :set_structure_assurance
    before_save :set_montants

    def self.montant_total
      all.reduce(0) {|m, o| m + o.montant_total}
    end
  end

  def set_structure_assurance
    self.structure_assurance = adherent.formule_en_cours.structure_assurance
  end

  def set_montants
    unless montant_total.nil?
      ticket_moderateur = adherent.formule_en_cours.ticket_moderateur
      self.montant_pris_en_charge = montant_total * (100 - ticket_moderateur) / 100
      self.montant_paye_par_adherent = montant_total * ticket_moderateur / 100
    end
  end
end
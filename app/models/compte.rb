class Compte < ActiveRecord::Base
  belongs_to :proprietaire, polymorphic: true
  has_many :versements

  def ajouter_versement!(montant)
    update(total_versement: self.total_versement + montant, solde: self.solde + montant)
  end

  def ajouter_retrait!(montant)
    update(total_retrait: self.total_retrait + montant, solde: self.solde - montant)
  end

  def solde_negatif?
    solde< 0
  end
end

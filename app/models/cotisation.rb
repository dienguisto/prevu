class Cotisation < ActiveRecord::Base
  default_scoped { order('pour_la_date DESC') }
  belongs_to :adherent
  belongs_to :souscription

  after_create :update_compte!

  private

  def update_compte!
    adherent.compte.ajouter_retrait!(montant)
  end
end

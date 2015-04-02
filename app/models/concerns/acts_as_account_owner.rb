module ActsAsAccountOwner
  extend ActiveSupport::Concern

  included do
    has_one :compte, as: :proprietaire, dependent: :destroy
    accepts_nested_attributes_for :compte

    after_create :generer_compte!

    delegate :solde_negatif?, to: :compte
    delegate :solde, to: :compte
  end

  def generer_compte!
    self.create_compte(total_versement: 0, total_retrait: 0, solde: 0) if compte.nil?
  end
end
class Medicament < ActiveRecord::Base
  include Activable
  has_many :detail_ordonnances
  before_create :set_status

  validates :nom,
            presence: true, uniqueness: true

  private
    def set_status
      self.actif = true
    end
end

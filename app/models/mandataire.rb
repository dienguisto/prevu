class Mandataire < ActiveRecord::Base
  enum type_piece: Adherent::TYPE_PIECE

  has_one :versement
  validates :prenom, :nom, presence: true
  validates :type_piece, presence: true, unless: 'numero_piece.empty?'
end

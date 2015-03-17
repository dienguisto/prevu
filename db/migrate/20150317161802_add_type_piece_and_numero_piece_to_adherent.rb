class AddTypePieceAndNumeroPieceToAdherent < ActiveRecord::Migration
  def change
    add_column :adherents, :type_piece_identite, :integer
    add_column :adherents, :numero_piece_identite, :string
  end
end

class AddMedicamentIdToDetailOrdonnance < ActiveRecord::Migration
  def change
    add_column :detail_ordonnances, :medicament_id, :integer
  end
end

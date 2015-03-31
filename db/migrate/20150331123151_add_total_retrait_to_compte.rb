class AddTotalRetraitToCompte < ActiveRecord::Migration
  def change
    add_column :comptes, :total_retrait, :float, null: false, default: 0
  end
end

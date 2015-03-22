class AddOrdonnanceIdToDetailOrdonnance < ActiveRecord::Migration
  def change
    add_column :detail_ordonnances, :ordonnance_id, :integer
  end
end

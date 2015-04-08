class FixColumnNameLibelleToNom < ActiveRecord::Migration
  def change
    rename_column :tags, :libelle, :nom
  end
end

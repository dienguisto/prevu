class RemoveTelephone1FromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :telephone1, :string
  end
end

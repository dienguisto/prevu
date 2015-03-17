class RemoveTelephone2FromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :telephone2, :string
  end
end

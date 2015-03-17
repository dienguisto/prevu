class RemoveEmailFromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :email, :string
  end
end

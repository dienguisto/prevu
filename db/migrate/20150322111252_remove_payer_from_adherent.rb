class RemovePayerFromAdherent < ActiveRecord::Migration
  def change
    remove_column :adherents, :payer, :boolean
  end
end

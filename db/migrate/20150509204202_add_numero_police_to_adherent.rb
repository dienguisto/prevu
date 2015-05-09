class AddNumeroPoliceToAdherent < ActiveRecord::Migration
  def change
    add_column :adherents, :numero_police, :string
  end
end

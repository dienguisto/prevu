class AddProfessionToAdherent < ActiveRecord::Migration
  def change
    add_column :adherents, :profession, :string
  end
end

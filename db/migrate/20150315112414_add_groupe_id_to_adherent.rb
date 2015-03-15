class AddGroupeIdToAdherent < ActiveRecord::Migration
  def change
    add_reference :adherents, :groupe, index: true
    add_foreign_key :adherents, :groupes
  end
end

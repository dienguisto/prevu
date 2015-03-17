class AddEntiteIdToUser < ActiveRecord::Migration
  def change
    add_reference :users, :entite, index: true
    add_foreign_key :users, :entites
  end
end

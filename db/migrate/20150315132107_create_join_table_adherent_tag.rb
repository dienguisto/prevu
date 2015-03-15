class CreateJoinTableAdherentTag < ActiveRecord::Migration
  def change
    create_join_table :adherents, :tags do |t|
      # t.index [:adherent_id, :tag_id]
      # t.index [:tag_id, :adherent_id]
    end
  end
end

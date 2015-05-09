class AddNumeroAssuranceToAdherent < ActiveRecord::Migration
  def change
    add_column :adherents, :numero_assurance, :string
  end
end

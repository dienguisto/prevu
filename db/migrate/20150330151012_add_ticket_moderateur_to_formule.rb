class AddTicketModerateurToFormule < ActiveRecord::Migration
  def change
    add_column :formules, :ticket_moderateur, :float, null: false
  end
end

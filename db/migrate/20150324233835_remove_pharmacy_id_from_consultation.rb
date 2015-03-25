class RemovePharmacyIdFromConsultation < ActiveRecord::Migration
  def change
    remove_column :consultations, :pharmacy_id, :integer
  end
end

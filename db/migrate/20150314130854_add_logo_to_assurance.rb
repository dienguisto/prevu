class AddLogoToAssurance < ActiveRecord::Migration
  def self.up
    add_attachment :structures, :logo
  end

  def self.down
    remove_attachment :structures, :logo
  end
end

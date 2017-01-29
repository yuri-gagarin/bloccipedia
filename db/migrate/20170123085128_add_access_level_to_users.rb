class AddAccessLevelToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :access_level, :integer, default: 0
  end

  def self.down
    remove_column :users, :access_level
  end
  
end

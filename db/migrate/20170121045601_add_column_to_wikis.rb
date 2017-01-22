class AddColumnToWikis < ActiveRecord::Migration[5.0]
  def self.up
    add_column :wikis, :category, :string
  end

  def self.down
    remove_column :wikis, :category, :string
  end
end

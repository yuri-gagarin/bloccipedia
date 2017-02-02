class DefaultWiki < ActiveRecord::Migration[5.0]
  
  def self.up
    change_column :wikis, :private, :boolean, default: false
  end

  def self.down
    change_column :wikis, :private, :boolean
  end

end

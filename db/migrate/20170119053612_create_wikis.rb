class CreateWikis < ActiveRecord::Migration[5.0]
  def self.up
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.boolean :private
      t.references :user, foreign_key: true

      t.timestamps
    end
  end

  def self.down
    drop_table :wikis
  end
end

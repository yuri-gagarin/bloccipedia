class AddStripeIdToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :stripe_id, :string
  end

  def self.down
    remove_column :users, :stripe_id, :string
  end
  
end

class DropUsersWikis < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_wikis
  end
end

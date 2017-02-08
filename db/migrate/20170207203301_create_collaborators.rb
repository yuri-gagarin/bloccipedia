class CreateCollaborators < ActiveRecord::Migration[5.0]
  def up
    create_table :collaborators do |t|
      t.integer "user_id"
      t.integer "wiki_id"

      t.timestamps
    end

    add_index :collaborators, ["user_id", "wiki_id"]

  end

  def down
    drop_table :collaborators
  end
  
end

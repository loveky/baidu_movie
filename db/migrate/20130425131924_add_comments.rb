class AddComments < ActiveRecord::Migration
  def up
    create_table :comments  do |t|
        t.string :content
        t.integer :user_id
        t.integer :movie_id

        t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end

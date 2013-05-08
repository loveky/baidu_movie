class CreatePlayHistories < ActiveRecord::Migration
  def up
    create_table :play_histories do |t|
      t.integer :movie_id
      t.integer :user_id

      t.timestamps
    end
  end

  def down
    drop_table :play_histories
  end
end

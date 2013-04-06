class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :from
      t.integer :movie_id

      t.timestamps
    end
  end
end

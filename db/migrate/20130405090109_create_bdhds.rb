class CreateBdhds < ActiveRecord::Migration
  def change
    create_table :bdhds do |t|
      t.string :url
      t.string :text
      t.integer :movie_id

      t.timestamps
    end
  end
end

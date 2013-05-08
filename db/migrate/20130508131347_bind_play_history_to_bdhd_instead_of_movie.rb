class BindPlayHistoryToBdhdInsteadOfMovie < ActiveRecord::Migration
  def up
    add_column :play_histories, :bdhd_id, :integer

    remove_column :play_histories, :movie_id
    remove_column :play_histories, :text
  end

  def down
    remove_column :play_histories, :bdhd_id

    add_column :play_histories, :movie_id, :integer
    add_column :play_histories, :text, :string
  end
end

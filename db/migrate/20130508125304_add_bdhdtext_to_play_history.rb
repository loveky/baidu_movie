class AddBdhdtextToPlayHistory < ActiveRecord::Migration
  def change
    add_column :play_histories, :text, :string
  end
end

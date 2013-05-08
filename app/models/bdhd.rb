class Bdhd < ActiveRecord::Base
  attr_accessible :movie_id, :text, :url
  belongs_to :movie
  has_many :play_histories
  has_many :users, through: :play_histories
end

class PlayHistory < ActiveRecord::Base
  attr_accessible :user_id, :movie_id

  belongs_to :movie
  belongs_to :user
end
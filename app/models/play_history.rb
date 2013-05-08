class PlayHistory < ActiveRecord::Base
  attr_accessible :user_id, :movie_id, :text

  belongs_to :movie
  belongs_to :user
end
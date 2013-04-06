class Bdhd < ActiveRecord::Base
  attr_accessible :movie_id, :text, :url
  belongs_to :movie
end

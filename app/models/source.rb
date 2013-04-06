class Source < ActiveRecord::Base
  attr_accessible :from, :movie_id
  belongs_to :movie
end

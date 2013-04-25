#encoding: utf-8
class Comment < ActiveRecord::Base
    attr_accessible :content, :user_id, :movie_id

    belongs_to :user
    belongs_to :movie
end
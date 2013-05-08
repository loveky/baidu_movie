class PlayHistory < ActiveRecord::Base
  attr_accessible :user_id, :bdhd_id, :text

  belongs_to :user
  belongs_to :bdhd
end
class PlayHistory < ActiveRecord::Base
  attr_accessible :user_id, :bdhd_id, :text

  default_scope order("updated_at DESC")

  belongs_to :user
  belongs_to :bdhd
end
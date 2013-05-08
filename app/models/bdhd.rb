class Bdhd < ActiveRecord::Base
  attr_accessible :movie_id, :text, :url
  belongs_to :movie
  has_many :play_histories
  has_many :users, through: :play_histories

  def watched_by(user)
    play_history = PlayHistory.where(bdhd_id: id, user_id: user.id)

    if play_history.empty?
      PlayHistory.create(bdhd_id: id, user_id: user.id)
    else
      play_history.first.touch
    end
  end
end

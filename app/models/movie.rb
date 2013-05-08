class Movie < ActiveRecord::Base
  attr_accessible :category, :name, :year
  has_many :bdhds
  has_many :sources
  has_many :comments
  has_many :play_histories
  has_many :users, through: :play_histories

  # Set for "will_paginate" gem
  self.per_page = 20
end

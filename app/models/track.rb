class Track < ApplicationRecord
  belongs_to :user

  validates_presence_of :sport
  validates_presence_of :day
  validates_presence_of :moving_time
  validates_presence_of :distance
end

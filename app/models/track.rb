class Track < ApplicationRecord
  default_scope { order(day: :desc) }
  belongs_to :user

  validates_presence_of :sport, :day, :distance, :moving_time
end

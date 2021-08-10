class Track < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :user

  validates :sport, presence: true
  validates :moving_time, presence: true
  validates :distance, presence: true
  validates :day, presence: true

end

class User < ApplicationRecord
  # User ∋o--③--++ Event
  belongs_to :event

  # User ++--①--o∈ Comment ∋o--②--++ Event
  has_many :comments
  has_many :events, through: :comment

  # User ++--⑥--+∈ UserSchedule ∋+--⑤--++ Schedule
  has_many :user_schedules
  has_many :schedules, through: :user_schedules
end

class User < ApplicationRecord
  # User ++--③--+∈ Event
  belongs_to :event

  # User ++--①--+∈ Comment ∋+--②--++ Event
  has_many :comments
  has_many :events, through: :comment

  # User ++--⑥--+∈ UserSchedule ∋+--⑤--++Schedule
  has_many :user_schedules
  has_maby :schedules, through: :user_schedules
end

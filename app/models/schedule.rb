class Schedule < ApplicationRecord
  # Schedule ++--④--+∈ Event
  belongs_to :event

  # Schedule ++--⑤--+∈ UserSchedule ++--⑥--∈ User
  has_many :user_schedules
  has_many :user, through: :user_schedules
end

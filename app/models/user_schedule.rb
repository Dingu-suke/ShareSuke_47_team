class UserSchedule < ApplicationRecord
  # UserSchedule ∋+--⑥--++ User
  belongs_to :user
  
  # UserSchedule ∋+--⑤--++ Schedule
  belongs_to :schedule

  # ユニークバリデーション
  validates :user_id, uniquness: { scope: :schedule_id }
end

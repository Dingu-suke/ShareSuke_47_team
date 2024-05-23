class UserSchedule < ApplicationRecord
  # 中間モデル
  
  # UserSchedule ∋+--⑥--++ User
  #              ∋+--⑤--++ Schedule
  belongs_to :user
  belongs_to :schedule

  # ユニークバリデーション
  validates :user_id, uniquness: { scope: :schedule_id }
end

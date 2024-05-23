class Comment < ApplicationRecord
  # Comment ∋+--①--++ User
  belongs_to :user

  # Comment ∋+--②--++ Event
  belongs_to :event

  # ユニークバリデーション
  validates :user_id, uniqueness: { scope: :event_id }
end

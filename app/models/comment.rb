class Comment < ApplicationRecord
  # Comment ∋o--①--++ User
  belongs_to :user

  # Comment ∋o--②--++ Event
  belongs_to :event

  # ユニークバリデーション
  validates :user_id, uniqueness: { scope: :event_id }
end

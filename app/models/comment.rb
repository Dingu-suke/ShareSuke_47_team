class Comment < ApplicationRecord
  # 中間モデル
  
  # Comment ∋o--①--++ User
  #         ∋o--②--++ Event
  belongs_to :user
  belongs_to :event

  # ユニークバリデーション
  validates :user_id, uniqueness: { scope: :event_id }
end

class Event < ApplicationRecord
  # Event ++--③--o∈ User 
  has_many :users
  
  # Event ++--④--+∈ Schedule
  has_many :schedules
  
  # Event ++--②--o∈ Comment ∋o--①--++ User
  has_many :comments
  has_many :users, through: :comments
end

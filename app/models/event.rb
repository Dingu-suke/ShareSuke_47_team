class Event < ApplicationRecord
  # Event ++--③--+∈ User 
  has_many :users
  
  # Event ++--④--+∈ Schedule
  has_many :schedules
  
  # Event ++--②--+∈ Comment ∋+--①--++ User
  has_many :comments
  has_many :users, through: :comments
end

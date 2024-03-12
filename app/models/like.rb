class Like < ApplicationRecord
  belongs_to :habit
  belongs_to :user

  validates_uniqueness_of :habit_id, scope: :user_id
end

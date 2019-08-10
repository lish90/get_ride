class Review < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :title, presence: true
  validates :details, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0 }, inclusion: { in: 0..5,
            message: "%{value} is not a a number between 1 and 5" }
end

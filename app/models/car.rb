class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :model, presence: true
  validates :make, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true, greater_than: 0 }
end

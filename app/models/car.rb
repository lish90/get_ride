class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  mount_uploader :photo, PhotoUploader

  validates :model, presence: true
  validates :make, presence: true
  validates :category, presence: true
  validates :description, presence: true
  validates :rate, presence: true, numericality: { only_integer: true, greater_than: 0 }
end

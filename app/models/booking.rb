class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :guest_number, presence: true
end

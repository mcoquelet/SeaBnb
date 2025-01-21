class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :island

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :guest_number, presence: true
end

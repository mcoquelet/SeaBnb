class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many_attached :images

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

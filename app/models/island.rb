class Island < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, through: :bookings

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def refresh_average_rating
    self.update(average_rating: self.reviews.average(:rating).to_f.round(1))
  end
end

class Review < ApplicationRecord
  belongs_to :booking
  validates :rating, presence: true

  after_create :update_island_rating

  private

  def update_island_rating
    self.booking.island.refresh_average_rating
  end
end

class User < ApplicationRecord
  has_many :islands
  has_many :bookings
  has_many :favorites
  has_many :favorite_islands, through: :favorites, source: :island
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

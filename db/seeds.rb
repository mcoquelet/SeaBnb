# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


#-------------- Clean Database ----------------
#
Island.destroy_all
User.destroy_all

# ------------- Users --------------------

User.create(
 first_name: 'Alice',
 last_name: 'Wonder',
 password: 'mypassword',
 bio: 'Loves exploring the realms of creativity.',
 email: 'alice.wonder@example.com'
)
User.create(
 first_name: 'Bob',
 last_name: 'Builder',
 password: 'mypassword',
 bio: 'An expert in constructing new ideas.',
 email: 'bob.builder@example.com'
)
User.create(
 first_name: 'Clara',
 last_name: 'Sky',
 password: 'mypassword',
 bio: 'Finds inspiration in the clouds above.',
 email: 'clara.sky@example.com'
)
User.create(
 first_name: 'Dylan',
 last_name: 'Stone',
 password: 'mypassword',
 bio: 'Grounded and passionate about innovation.',
 email: 'dylan.stone@example.com'
)
User.create(
 first_name: 'Ella',
 last_name: 'Bloom',
 password: 'mypassword',
 bio: 'A budding visionary with a green thumb.',
 email: 'ella.bloom@example.com'
)

puts "Created #{User.count} users."

# ------------- Islands --------------------

Island.create(
  name: "Paradise Island",
  description: "A beautiful tropical island with white sandy beaches and crystal-clear waters.",
  location: "Caribbean Sea",
  longitude: "-75.1234",
  latitute: "18.4567",
  price: 5000,
  capacity: 20,
  average_rating: 4.8,
  user_id: User.first.id
)

Island.create(
  name: "Emerald Haven",
  description: "An exotic getaway surrounded by lush greenery and vibrant coral reefs.",
  location: "Pacific Ocean",
  longitude: "123.4567",
  latitute: "10.2345",
  price: 7000,
  capacity: 15,
  average_rating: 4.9,
  user_id: User.first.id
)

Island.create(
  name: "Golden Sands",
  description: "A serene island offering breathtaking sunsets and golden sandy shores.",
  location: "Indian Ocean",
  longitude: "80.5678",
  latitute: "-5.4321",
  price: 4500,
  capacity: 25,
  average_rating: 3.8,
  user_id: User.first.id
)

Island.create(
  name: "Azure Bay",
  description: "A tranquil island surrounded by turquoise waters, perfect for a peaceful retreat.",
  location: "Mediterranean Sea",
  longitude: "12.3456",
  latitute: "37.1234",
  price: 6000,
  capacity: 18,
  average_rating: 4.7,
  user_id: User.last.id
)

Island.create(
  name: "Crystal Cove",
  description: "An idyllic island with hidden coves and pristine beaches, ideal for adventure seekers.",
  location: "South Pacific",
  longitude: "-150.7890",
  latitute: "-17.8901",
  price: 8000,
  capacity: 100,
  average_rating: 5,
  user_id: User.last.id
)

puts "Created #{Island.count} islands."

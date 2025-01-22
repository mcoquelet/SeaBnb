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
  name: "Bora Bora Paradise",
  description: "A luxurious island surrounded by turquoise lagoons and coral reefs.",
  location: "French Polynesia",
  longitude: -151.7415,
  latitude: -16.5004,
  price: 8000,
  capacity: 12,
  average_rating: 5.0,
  user_id: User.first.id
)

Island.create(
  name: "Santorini Retreat",
  description: "A stunning island famous for its whitewashed houses and blue-domed churches.",
  location: "Aegean Sea, Greece",
  longitude: 25.4615,
  latitude: 36.3932,
  price: 6000,
  capacity: 20,
  average_rating: 4.7,
  user_id: User.first.id
)

Island.create(
  name: "Malé Escape",
  description: "An exotic island offering unparalleled access to vibrant marine life.",
  location: "Maldives",
  longitude: 73.5093,
  latitude: 4.1755,
  price: 5000,
  capacity: 15,
  average_rating: 4.8,
  user_id: User.first.id
)

Island.create(
  name: "Nuuk Serenity",
  description: "A remote arctic island offering peace, solitude, and breathtaking auroras.",
  location: "Greenland",
  longitude: -51.7214,
  latitude: 64.1836,
  price: 7000,
  capacity: 10,
  average_rating: 4.6,
  user_id: User.last.id
)

Island.create(
  name: "Maui Oasis",
  description: "An island gem known for its lush valleys, volcanic craters, and stunning beaches.",
  location: "Hawaii, USA",
  longitude: -156.3319,
  latitude: 20.7984,
  price: 5500,
  capacity: 30,
  average_rating: 4.9,
  user_id: User.last.id
)

puts "Created #{Island.count} islands."

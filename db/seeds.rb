# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# allows application to access files from URLs
require 'open-uri'

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

User.create(
  first_name: 'Felix',
  last_name: 'Wander',
  password: 'mypassword',
  bio: 'A digital nomad with a love for adventure.',
  email: 'felix.wander@example.com'
)

User.create(
  first_name: 'Grace',
  last_name: 'Harbor',
  password: 'mypassword',
  bio: 'Navigating life’s waves with a steady hand.',
  email: 'grace.harbor@example.com'
)

User.create(
  first_name: 'Henry',
  last_name: 'Everest',
  password: 'mypassword',
  bio: 'Always reaching for new heights.',
  email: 'henry.everest@example.com'
)

User.create(
  first_name: 'Isla',
  last_name: 'Vale',
  password: 'mypassword',
  bio: 'Draws inspiration from tranquil landscapes.',
  email: 'isla.vale@example.com'
)

User.create(
  first_name: 'Jack',
  last_name: 'Summit',
  password: 'mypassword',
  bio: 'Thrives on challenges and new perspectives.',
  email: 'jack.summit@example.com'
)


puts "Created #{User.count} users 👥"

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

Island.create(
  name: "Palawan Haven",
  description: "A tropical paradise known for its crystal-clear waters, limestone cliffs, and hidden lagoons.",
  location: "Philippines",
  longitude: 119.5107,
  latitude: 9.8349,
  price: 6200,
  capacity: 18,
  average_rating: 4.8,
  user_id: User.first.id
)

Island.create(
  name: "Seychelles Escape",
  description: "A breathtaking island archipelago with white sandy beaches and lush nature reserves.",
  location: "Seychelles",
  longitude: 55.4920,
  latitude: -4.6796,
  price: 7500,
  capacity: 25,
  average_rating: 4.9,
  user_id: User.first.id
)

Island.create(
  name: "Zakynthos Bliss",
  description: "A stunning Greek island famous for its Navagio Beach and electric blue waters.",
  location: "Ionian Sea, Greece",
  longitude: 20.7660,
  latitude: 37.7916,
  price: 5700,
  capacity: 22,
  average_rating: 4.7,
  user_id: User.last.id
)

Island.create(
  name: "Fiji Hideaway",
  description: "A remote island paradise with vibrant coral reefs and stunning overwater bungalows.",
  location: "Fiji",
  longitude: 178.0650,
  latitude: -17.7134,
  price: 6800,
  capacity: 20,
  average_rating: 4.6,
  user_id: User.last.id
)

Island.create(
  name: "Phuket Getaway",
  description: "A Thai island with golden beaches, lively nightlife, and breathtaking viewpoints.",
  location: "Thailand",
  longitude: 98.3381,
  latitude: 7.8804,
  price: 5300,
  capacity: 28,
  average_rating: 4.7,
  user_id: User.first.id
)

puts "Created #{Island.count} islands 🏝"

# ------------- Images --------------------
photos = [
  [
    "https://www.themilliardaire.com/wp-content/uploads/2015/10/Four-Season-Bora-Bora-1.jpg",
    "https://bookretreats.com/cdn-cgi/image/width=1200,quality=65,f=auto,sharpen=1,fit=cover,gravity=auto/assets/photo/retreat/0m/32k/32029/p_1039379/1000_1682673845.jpg",
    "https://www.themilliardaire.com/wp-content/uploads/2015/10/Four-Season-Bora-Bora-1.jpg"
  ],
  [
    "https://bookretreats.com/cdn-cgi/image/width=1200,quality=65,f=auto,sharpen=1,fit=cover,gravity=auto/assets/photo/retreat/0m/32k/32029/p_1039379/1000_1682673845.jpg",
    "https://bookretreats.com/cdn-cgi/image/width=1200,quality=65,f=auto,sharpen=1,fit=cover,gravity=auto/assets/photo/retreat/0m/32k/32029/p_1039379/1000_1682673845.jpg",
    "https://bookretreats.com/cdn-cgi/image/width=1200,quality=65,f=auto,sharpen=1,fit=cover,gravity=auto/assets/photo/retreat/0m/32k/32029/p_1039379/1000_1682673845.jpg"
  ],
  [
    "https://ulysse.com/news/wp-content/uploads/2024/01/Les-iles-Maldives-.jpg"
  ],
  [
    "https://guidetogreenland.com/wp-content/uploads/2020/05/nuuk-the-worlds-smallest-capital-4-day-package-tour-from-iceland-to-greenland-day-Guide-to-Greenland1.jpg",
  ],
  [
    "https://www.usatravel.be/web/image/product.public.category/25/main_image?unique=80270bd"
  ],
  [
    "https://inspirationseek.com/wp-content/uploads/2014/11/Palawan-Island-Resort-El-Nido.jpg"
  ],
  [
    "https://seychellestourism.in/wp-content/uploads/where-is-seychelles-island-located-on-world-map-europe-africa-india-1568x1045.jpg"
  ],
  [
    "https://mediaim.expedia.com/destination/1/27df0f9f399aaec26a64b7a06606ca7d.jpg"
  ],
  [
    "https://cf.bstatic.com/xdata/images/hotel/max1024x768/77028250.jpg?k=297ee5b16b3cfc217366615354ab23669655e27164569b61dd07892208ad6b29&o=&hp=1"
  ],
  [
    "https://photos.tpn.to/ph/ok/np/tj/1600x900.jpg"
  ]
]

Island.all.each_with_index do |island, index|
  photos[index].each_with_index do |photo_url, photo_index|
    file = URI.parse(photo_url).open
    island.photos.attach(io: file, filename: "island_#{index + 1}_photo_#{photo_index + 1}.jpg", content_type: "image/jpeg")
    puts "Attached image #{photo_index + 1} to #{island.name}"
  end
end

puts "Attached images to all islands 🖼"


# ------------- Bookings and reviews --------------------

20.times do |i|
  booking = Booking.create(
    start_date: Date.today - i*5,
    end_date: Date.today - i*5 + 6,
    island_id: Island.all.sample.id,
    user_id: User.all.sample.id,
    guest_number: [50, 100, 200, 500, 1000].sample
  )

  booking.reviews.create(
    created_at: booking.end_date + 2,
    rating: [3, 4, 5].sample,
    comment: ["A fantastic experience!",
              "A wonderful getaway!",
              "An unforgettable adventure!",
              "A peaceful retreat.",
              "A tropical paradise.",
              "An island that offers something for everyone.",
              "A beautiful island with so much to offer.",
              "A hidden gem with so much to explore.",
              "A breathtaking escape from the busy world! The serene beaches and lush landscapes make it a paradise for relaxation and adventure alike.",
              "The perfect place to unwind and recharge. Every sunset felt magical, and the hospitality was truly exceptional!",
              "An absolute dream destination! From the crystal-clear waters to the vibrant marine life, every moment felt like a scene from a postcard.",
              "Stunning views and incredible hospitality! The locals were so welcoming, and every corner of the island had something unique to offer.",
              "A slice of heaven on Earth! The combination of white sandy beaches, turquoise waters, and gentle ocean breezes made it an unforgettable experience.",
              "Pure tranquility surrounded by nature's beauty. Waking up to the sound of waves and birds was an experience I’ll cherish forever!",
              "An island adventure like no other! Whether you're exploring hidden caves, snorkeling in colorful reefs, or just enjoying the sun, there’s something for everyone.",
              "Crystal-clear waters and golden sunsets—unforgettable! This island is the perfect place to relax, explore, and make beautiful memories.",
              "A must-visit for any nature lover! The diverse wildlife, pristine beaches, and breathtaking landscapes make it a true paradise.",
              "The best vacation I’ve ever had! Everything from the food to the activities to the stunning scenery was absolutely perfect. I can't wait to come back!"].sample
  )
end

puts "Created #{Booking.count} bookings 📅"

puts "Created #{Review.count} reviews 🌟"

puts "Seeds complete! 🌱"

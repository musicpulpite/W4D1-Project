# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  puts 'Beginning to seed'
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all
puts "Destroyed everything"


larry = User.create!(
  username: "Larry",
  email: 'larry@testmail.com'
)

michael = User.create!(
  username: "Michael",
  email: 'michael@testmail.com'
)

sergey = User.create!(
  username: "Sergey",
  email: 'sergey@testmail.com'
)

mona_lisa = Artwork.create!(
  title: "Mona Lisa",
  image_url: "https://upload.wikimedia.org/wikipedia/commons/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg",
  artist_id: larry.id
)

la_persistencia = Artwork.create!(
  title: "La Persistencia de Memoria",
  image_url: "https://cdn.culturagenial.com/es/imagenes/dali-la-persistencia-de-la-memoria-cke.jpg",
  artist_id: michael.id
)

s1 = ArtworkShare.create!(
  artwork_id: mona_lisa.id,
  viewer_id: michael.id
)
s2 = ArtworkShare.create!(
  artwork_id: mona_lisa.id,
  viewer_id: sergey.id
)
s3 = ArtworkShare.create!(
  artwork_id: la_persistencia.id,
  viewer_id: sergey.id
)
s4 = ArtworkShare.create!(
  artwork_id: la_persistencia.id,
  viewer_id: larry.id
)

puts 'finished seeding'

require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
dishoom = { name: 'Dishoom', address: '7 Boundary St, London E2 7JE', stars: 5, chef_name: 'Ignacio' }
pizza_east = { name: 'Pizza East', address: '56A Shoreditch High St, London E1 6PQ', stars: 4, chef_name: 'Caio' }

[dishoom, pizza_east].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  Review.create!(content: Faker::Restaurant.review, restaurant: restaurant)
  puts "Created #{restaurant.name}"
end
puts 'Finished!'

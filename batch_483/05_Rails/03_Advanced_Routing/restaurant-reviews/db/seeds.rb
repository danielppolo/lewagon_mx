require 'faker'

puts 'Deleting all instances of Restaurant'
Restaurant.destroy_all

puts 'Instantiating new Restaurant instances'

20.times do 
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    stars: rand(5),
    chef_name: Faker::Name.name
  )

  5.times do
    Review.create!(
      # restaurant_id: restaurant.id, #Restaurant ID <Intenger>
      restaurant: restaurant, #Restaurant instance
      content: Faker::Restaurant.review  
    )
  end
end

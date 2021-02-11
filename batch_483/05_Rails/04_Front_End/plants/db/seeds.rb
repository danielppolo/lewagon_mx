Garden.destroy_all if Rails.env.development?

little = Garden.create!(
  name: 'My Little Garden',
  banner_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_1.jpg'
)

other = Garden.create!(
  name: 'My Other Garden',
  banner_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/garden_2.jpg'
)

Plant.create!(
  name: 'Monstera',
  image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/monstera.jpg',
  garden: little
)

Plant.create!(
  name: 'Philo',
  image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/philo.jpg',
  garden: little
)

Plant.create!(
  name: 'Dieff',
  image_url: 'https://raw.githubusercontent.com/lewagon/fullstack-images/master/rails/parks-and-plants/plants/dieffenbachia.jpg',
  garden: other
)

plant_label = %w[
  Annuals 
  Bulbs 
  Cactus
  Succulents 
  Climbers 
  Conifers 
  Ferns 
  Fruit 
  Herbs 
]
plant_label.each do |label|
  Label.create!(name: label)
end
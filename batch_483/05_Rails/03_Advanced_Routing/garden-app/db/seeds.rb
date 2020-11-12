require 'faker'

Garden.destroy_all

10.times do 
  Garden.create!(
    name: Faker::TvShows::RickAndMorty.character,
    image_url: "https://picsum.photos/seed/seed-#{rand(999)}/200/300"
  )
end
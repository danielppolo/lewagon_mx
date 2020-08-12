Garden.destroy_all

garden_urls = [
  'https://images.unsplash.com/photo-1506941433945-99a2aa4bd50a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1234&q=80',
  'https://images.unsplash.com/photo-1571192776145-9f563c1df686?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1578302758063-0ef3e048ca89?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1955&q=80',
  'https://images.unsplash.com/photo-1587826970409-1d45c27f1005?ixlib=rb-1.2.1&auto=format&fit=crop&w=1867&q=80',
  'https://images.unsplash.com/photo-1591676942718-a4c1450f3425?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
]

puts 'Creating gardens....'
garden_urls.each do |url|
  Garden.create({
                  name: Faker::Lorem.word,
                  banner_url: url
                })
end
puts 'Finished!'

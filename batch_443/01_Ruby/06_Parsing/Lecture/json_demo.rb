require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

file_doc = File.read(filepath)
beer_hash = JSON.parse(file_doc)

new_beer = { name: 'Sol', appearance: 'blonde', origin: 'Mexico'}
beer_hash['beers'] << new_beer

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beer_hash))
end
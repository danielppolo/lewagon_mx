require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

string_file = File.read(filepath)
beers =  JSON.parse(string_file)

# Modify my data
beers["beers"].push({
  "name" => "Sol",
  "appearance" =>  "Blonde",
  "origin" =>  "Mexico"
})


beers_string = JSON.generate(beers)
File.open(filepath, 'wb') do |file|
  file.write(beers_string)
end

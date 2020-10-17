require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
username = "danielppolo"
url = 'https://api.github.com/users/' + username

document = open(url).read
user = JSON.parse(document)

filepath = "data/#{username}.json"
File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(user))
end

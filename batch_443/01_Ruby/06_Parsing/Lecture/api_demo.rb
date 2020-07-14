require 'json'
require 'open-uri'

# TODO - Let's fetch name and bio from a given GitHub username
url = 'https://api.github.com/users/danielppolo'

url_serialized = open(url).read

user = JSON.parse(url_serialized)

File.open('data/github_user.json', 'wb') do |file|
  file.write(JSON.generate(user))
end
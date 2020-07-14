require_relative 'scraper'
require 'yaml'
require 'json'

url = 'https://www.imdb.com/chart/top'

# Get the top 5 movies (URLs)
top_movies = fetch_top_5(url) # Array

top_movie_details = []

# Fetch each URL 
top_movies.each do |movie_url|
  top_movie_details << fetch_movie_details(movie_url)
end

File.open('movies.json',  'wb') do |file|
  file.write(JSON.generate(top_movie_details))
end
# Save the top movies into YAML
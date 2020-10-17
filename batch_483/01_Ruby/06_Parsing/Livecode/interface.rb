require_relative 'scraper'
require 'json'
require 'yaml'

top_movies = []

top_5 = fetch_movies_url() #Array

top_5.each do |url|
  movie = scrape_movie(url)
  top_movies.push(movie) #Hash
end

# top_movies_string = JSON.generate(top_movies) #String
top_movies_string = top_movies.to_yaml

File.open('movies.yml', 'wb') do |file|
  file.write(top_movies_string)
end


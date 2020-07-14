require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com
url = 'https://www.bbcgoodfood.com/search/recipes?query=chocolate'
html_file = open(url).read # => String
html_doc = Nokogiri::HTML(html_file)

# Selectors
# HTML Tags h1,h1,a,article,img
# Classes .YOUR_CLASS
# ID #YOUR_ID
html_doc.search('.teaser-item__title a').each do |recipe_title| 
  puts recipe_title.attribute('href').value
end


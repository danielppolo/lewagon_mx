require 'open-uri'
require 'nokogiri'

# Let's scrape recipes from http://www.epicurious.com

url = "https://www.bbcgoodfood.com/search/recipes?q=chocolate"
recipes = []
document_string = open(url).read
document = Nokogiri::HTML(document_string)

document.search('.standard-card-new__article-title').each do |title|
  recipes.push(title.text)
end


puts recipes.inspect
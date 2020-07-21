require_relative 'recipe'

class ScrapperBBCGoodFoodService

  BASE_URL = 'https://www.bbcgoodfood.com/search/recipes'
  
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    query = "?query=#{@ingredient}"
    # 1. BUILD the URL to fetch
    html_file = open(BASE_URL + query)
    # 2. CONVERT the HTML into the NOKOGIRI::HTML class
    doc = Nokogiri::HTML(html_file, nil, 'utf-8')
    # 3. INITIALIZE an empty array to hold the recipes
    recipes = []
    # 4. ITERATE through every recipe card in the HTML
    doc.search('.node-recipe').each do |recipe|
      title =  recipe.search('.teaser-item__title').text.strip
      description = recipe.search('.teaser-item__text-content').text.strip
      prep_time = recipe.search('.teaser-item__info-items .teaser-item__info-item--total-time').text.strip
      # 5. PUSH Recipe instance into the array
      recipes << Recipe.new(title, description, prep_time, false)
    end
    # 6. Return the array
    recipes
  end
  
end
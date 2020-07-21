require 'nokogiri'
require 'open-uri'
require_relative "view"
require_relative 'recipe'
require_relative 'scrapper_bbc_good_food_service'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def destroy
    display_recipes
    # 3. ASK VIEW for a number to delete
    recipe_index = @view.ask_for_index
    # 4. ASK REPO to remove it
    @cookbook.remove_recipe(recipe_index)
  end

  def mark_as_done
    # 1. Display all recipes in repository (Cookbook)
    display_recipes
    # 2. ASK VIEW for a number to mark as done
    recipe_index = @view.ask_for_index
    # 1. ASK REPO to mark a Recipe as done
    @cookbook.mark_as_done(recipe_index)
  end

  def list
    display_recipes
  end

  def create
    # 1. ASK VIEW for a name
    name = @view.ask_for_string("name")
    # 2. ASK VIEW for a description
    description = @view.ask_for_string("description")
    # 2.5 ASK VIEW for a prep_time
    prep_time = @view.ask_for_integer("preparation time (in minutes)")
    # 3. ASK RECIPE to initialize a recipe
    recipe = Recipe.new(name, description, prep_time, false)
    # 4. ASK REPO to persist it
    @cookbook.add_recipe(recipe)
  end
    
  def import
    # 1. ASK VIEW for an ingredient
    query = @view.ask_for_ingredient
    @view.print("Looking for \"#{query}\" recipes on the Internet...")
    # 2. FETCH from the internet a list of recipes
    recipes = ScrapperBBCGoodFoodService.new(query).call
    # 3. VIEW displays first 5 recipes
    @view.display_recipes(recipes.first(5))
    # 4. ASK view for a index
    recipe_index = @view.ask_for_index
    # 5. ADD the recipe to the repository (Cookbook)
    @cookbook.add_recipe(recipes[recipe_index])
  end

  private

  def display_recipes
    # 1. ASK REPO for recipes
    recipes = @cookbook.all
    # 2. ASK VIEW to display them
    @view.display_recipes(recipes)
  end
end

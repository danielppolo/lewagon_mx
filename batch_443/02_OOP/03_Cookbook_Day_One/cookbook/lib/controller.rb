require_relative "view"

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

  def list
    display_recipes
  end

  def create
    # 1. ASK VIEW for a name
    name = @view.ask_for_string("name")
    # 2. ASK VIEW for a description
    description = @view.ask_for_string("description")
    # 3. ASK RECIPE to initialize a recipe
    recipe = Recipe.new(name, description)
    # 4. ASK REPO to persist it
    @cookbook.add_recipe(recipe)
  end

  private

  def display_recipes
    # 1. ASK REPO for recipes
    recipes = @cookbook.all
    # 2. ASK VIEW to display them
    @view.display_recipes(recipes)
  end
end

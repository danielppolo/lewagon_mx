require "csv"
require_relative "recipe"

class Cookbook
  def initialize(csv_path)
    @recipes = []
    @csv_path = csv_path
    load_recipes_from_csv
  end

  def add_recipe(recipe)
    @recipes << recipe
    update_recipes_to_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    update_recipes_to_csv
  end

  def all
    @recipes
  end

  private

  def update_recipes_to_csv
    # Reflect @recipes into the CSV
    CSV.open(@csv_path, "wb") do |csv|
      @recipes.each do |recipe|
        # recipe => Recipe instance
        csv << [recipe.name, recipe.description]
      end
    end
  end

  def load_recipes_from_csv
    CSV.foreach(@csv_path) do |row|
      # row => ["Caiprinha", "Cachaça and Lemon"]
      @recipes << Recipe.new(row[0], row[1])
    end
  end
end

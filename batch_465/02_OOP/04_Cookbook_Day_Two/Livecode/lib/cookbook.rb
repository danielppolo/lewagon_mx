require_relative 'recipe'
require 'csv'

class Cookbook

  def initialize(csv_filepath)
    @csv_filepath = csv_filepath
    @recipes = [] # Array of Recipe(s)
    read_csv
  end

  def all
    return @recipes 
  end

  def create(recipe_instance) # <Recipe:0x000055d8a70ac780>
    # Store it in ruby
    @recipes << recipe_instance
    save_to_csv
  end


  def destroy(index) #Integer
    # Destroy in Ruby
    @recipes.delete_at(index)
    #Destroy in CSV
    save_to_csv
  end

  private

  def read_csv
    CSV.foreach(@csv_filepath) do |row| # Array
      # Row => ["taco","taco al pastor"]
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_to_csv
    CSV.open(@csv_filepath, 'wb') do |file|
      @recipes.each do |recipe_instance| # <Recipe:0x000055d8a70ac780>
        file << [recipe_instance.name, recipe_instance.description]
      end
    end
  end
  
end

require_relative '../models/meal.rb'
require 'csv'

class MealRepository
  def initialize(file_path)
    @file_path = file_path
    @meals = []
    @next_id = 1
    load_csv() if File.exist?(file_path) #Boolean
  end

  def all
    @meals
  end

  def create(meal_instance)
    meal_instance.id = @next_id
    @meals << meal_instance
    @next_id +=1
    save_to_csv
  end

  def update(index, new_meal)
    # GET THE INDEX IN THE MEAL
    new_meal.id = @meals[index - 1].id
    @meals[index - 1] = new_meal 
    save_to_csv # Update the CSV with updated meal.
  end

  def find(id)
    return @meals.find { |meal| meal.id == id}
  end

  private

  def save_to_csv
    CSV.open(@file_path, 'wb') do |file|
      file << %w[id name price]
      @meals.each do |meal|
        file << [meal.id, meal.name, meal.price]
      end
    end
  end

  def load_csv
    CSV.foreach(@file_path, { 
        headers: :first_row, 
        header_converters: :symbol 
      }) do |row| #Hash-like
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @meals.push(Meal.new(row))
      @next_id = row[:id] + 1
    end
  end
  
end
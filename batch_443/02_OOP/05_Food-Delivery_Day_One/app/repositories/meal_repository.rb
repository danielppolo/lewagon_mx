require 'csv'
require_relative '../models/meal'

class MealRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @meals    = []
    @next_id  = 1

    load_csv if File.exist?(@csv_file)
  end

  def all
    @meals
  end

  def create(meal)
    # add the id to the meal
    meal.id = @next_id
    # add the meal to the @meals array
    @meals << meal
    # add the meal to the csv
    @next_id += 1

    save_csv
  end

  def find(id)
    @meals.find { |meal| meal.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id]       = row[:id].to_i             # Convert column to Integer
      row[:price]    = row[:price].to_i          # Convert column to Integer

      @meals << Meal.new(row)

      @next_id += 1
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

    CSV.open(@csv_file, 'wb', csv_options) do |csv|
      csv << ['id', 'name', 'price']

      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end

# meal_repo = MealRepository.new('meals_test.csv')

# pizza = Meal.new(name: 'pizza', price: 1)

# meal_repo.create(pizza)

# p meal_repo

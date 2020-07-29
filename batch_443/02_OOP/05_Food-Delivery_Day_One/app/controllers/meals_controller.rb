require_relative '../views/meal_view'

class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @meal_view = MealView.new
  end

  # MealsController #add should ask the user for a name and price, then store the new meal
  def add
    # 1. Ask the user for the meal name and store in var
    name = @meal_view.ask_name
    # 2. Ask the user for the meal price and store in var
    price = @meal_view.ask_price
    # 3. Create a new meal instance with those values
    meal = Meal.new(name: name, price: price)
    # 4. Add to repository using #create
    @meal_repo.create(meal)
  end

  #   2) MealsController #list should grab meals from the repo and display them
  def list
    # 1. Ask the repo to bring all meals #all
    meals = @meal_repo.all
    # 2. Pass the meals to the view to display them
    @meal_view.display_all(meals)
  end
end

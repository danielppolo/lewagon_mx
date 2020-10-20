require_relative '../views/meal_view'

class MealsController

  def initialize(meal_repo)
    @meal_repository = meal_repo
    @view = MealView.new
  end
  
  def list
    @view.display_list(@meal_repository.all)
  end

  def add
    # ask the user for the name
    name =  @view.display('name')
    # ask the user for the price
    price =  @view.display('price').to_i
    # create a new instance of Meal
    meal = Meal.new(name: name, price: price)
    # store the instance in the Repository
    @meal_repository.create(meal)
  end
  

  def edit
    # Get the ID of the one to edit
    list()
    index_in_the_list = @view.display('id').to_i
    # ask the user for the name
    name =  @view.display('name')
    # ask the user for the price
    price =  @view.display('price').to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.update(index_in_the_list, meal)
  end
end
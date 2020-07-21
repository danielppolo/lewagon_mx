require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/meal_repository'

meals_csv            = 'spec/support/meals.csv'
customers_csv        = 'spec/support/customers.csv'
meal_repo            = MealRepository.new(meals_csv)
customer_repo        = CustomerRepository.new(customers_csv)
meals_controller     = MealsController.new(meal_repo)
customers_controller = CustomersController.new(customer_repo)

router = Router.new(meals_controller, customers_controller)
router.run

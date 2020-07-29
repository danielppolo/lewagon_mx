require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository     = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository    = order_repository
    @orders_view         = OrdersView.new
  end

  def add
    # Display list of meals and ask for the index of the one we need and save in meal_index var
    meals = @meal_repository.all
    @orders_view.display_meals(meals)
    meal_index = @orders_view.ask_for_index
    meal       = meals[meal_index]
    # Display list of customers and ask for index to pick
    customers = @customer_repository.all
    @orders_view.display_customers(customers)
    customer_index = @orders_view.ask_for_index
    customer       = customers[customer_index]
    # Display list of delivery guys and ask for index to pick
    employees = @employee_repository.all_delivery_guys
    @orders_view.display_employees(employees)
    employee_index = @orders_view.ask_for_index
    employee       = employees[employee_index]

    # Create the order
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    # Get all the undelivered orders
    undelivered_orders = @order_repository.undelivered_orders
    # Display the orders through the view
    @orders_view.display_orders(undelivered_orders)
  end

  def list_my_orders(employee)
    my_orders = @order_repository.employee_undelivered_orders(employee)

    @orders_view.display_orders(my_orders)
  end

  def mark_as_delivered(employee)
    # Displaying undelivered
    list_my_orders(employee)
    order_index        = @orders_view.ask_for_index
    undelivered_orders = @order_repository.employee_undelivered_orders(employee)
    order = undelivered_orders[order_index]

    order.deliver!
    @order_repository.save_csv
  end
end

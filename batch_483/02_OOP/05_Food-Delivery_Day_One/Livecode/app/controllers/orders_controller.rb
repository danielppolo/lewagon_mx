require_relative '../views/order_view'

class OrdersController

  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @order_view = OrderView.new
  end

  def add
    meals = @meal_repository.all
    @order_view.display(meals)
    meal_index = @order_view.ask('meal')
    @order_view.separator
    customers = @customer_repository.all
    @order_view.display(customers)
    customer_index = @order_view.ask('customer')
    @order_view.separator
    employees = @employee_repository.all_delivery_guys
    @order_view.display(employees)
    employee_index = @order_view.ask('delivery guy')

    
    meal = meals[meal_index - 1]
    customer = customers[customer_index - 1]
    employee = employees[employee_index - 1]
    
    new_order = Order.new({
      meal: meal,
      customer: customer,
      employee: employee,
    })

    @order_repository.create(new_order)
  end
  

  def list
    orders = @order_repository.all_undelivered
    @order_view.display(orders)
  end

  def mark_as_done(employee)
    orders = @order_repository.my_undelivered(employee)
    @order_view.display(orders)
    order_index = @order_view.ask('order')
    order = orders[order_index - 1]
    @order_repository.mark_as_done(order)
  end

  def list_undelivered(employee)
    undelivered_orders = @order_repository.my_undelivered(employee)
    @order_view.display(undelivered_orders)
  end
end
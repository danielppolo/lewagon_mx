class OrdersView
  def display_orders(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}, #{order.meal.name}, #{order.customer.name}, #{order.employee.username}"
    end 
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}, #{meal.name}, $#{meal.price}"
    end 
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}, #{customer.name}, #{customer.address}"
    end 
  end

  def display_employees(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}, #{employee.username}, #{employee.role}"
    end 
  end

  def ask_for_index
    puts 'Index:'
    print '> '
    gets.chomp.to_i - 1
  end
end
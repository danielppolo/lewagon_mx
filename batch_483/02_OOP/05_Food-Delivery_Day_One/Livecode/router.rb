class Router 
 def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
   @running = true
   @meals_controller = meals_controller
   @customers_controller = customers_controller
   @sessions_controller = sessions_controller
   @orders_controller = orders_controller
 end

 def run
  # LOGIN
  @user = @sessions_controller.login
  while @running
    if @user.manager? 
      display_manager_tasks
      user_choice = gets.chomp.to_i
      manager_call_to_action(user_choice)
    else #Delivery guy
      display_delivery_guy_tasks
      user_choice = gets.chomp.to_i
      delivery_guy_call_to_action(user_choice)
    end
  end
 end

 def display_manager_tasks
  puts "------------------------------"
  puts "------------ MENU ------------"
  puts "------------------------------"
  puts "What do you want to do"
  puts "1 - List all meals"
  puts "2 - Add a meal"
  puts "3 - List all customers"
  puts "4 - Add a customer"
  puts "5 - Add an order"
  puts "6 - List all undelivered orders"
  puts "9 - Quit"
  print "> "
 end

 def display_delivery_guy_tasks
  puts "------------------------------"
  puts "------------ MENU ------------"
  puts "------------------------------"
  puts "What do you want to do"
  puts "1 - Mark order as delivered"
  puts "2 - List all my undelivered orders"
  puts "9 - Quit"
  print "> "
 end

  def manager_call_to_action(choice)
    case choice
    when 1
      @meals_controller.list
    when 2
      @meals_controller.add
    when 3
      @customers_controller.list
    when 4
      @customers_controller.add
    when 5
      @orders_controller.add
    when 6
      @orders_controller.list
    when 9
      @running = false
    else
      puts 'Choose another one....'
    end
  end

  def delivery_guy_call_to_action(choice)
    case choice
    when 1
      @orders_controller.mark_as_done(@user)
    when 2
      @orders_controller.list_undelivered(@user)
    when 9
      @running = false
    else
      puts 'Choose another one....'
    end
  end
end
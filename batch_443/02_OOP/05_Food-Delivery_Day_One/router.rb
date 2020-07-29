class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller     = meals_controller
    @customers_controller = customers_controller
    @sessions_controller  = sessions_controller
    @running              = true
  end

  def run
    while @running
      # Instance of employee
      @current_user = @sessions_controller.login
      while @current_user
        # managers have different menu
        if @current_user.manager?
          manager_actions
        else
          delivery_guy_actions
        end
        # delivery_guys have a menu
      end
      print `clear`
    end
  end

  private

  def manager_actions
    print_manager_options
    choice = gets.chomp.to_i
    print `clear`
    manager_action(choice)
  end

  def delivery_guy_actions
    print_delivery_guy_options
    choice = gets.chomp.to_i
    print `clear`
    delivery_guy_action(choice)
  end

  def print_shared_options
    puts '8 - Logout'
    puts "9 - Quit"
    print "> "
  end

  def print_delivery_guy_options
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "1 - List my undelivered orders"
    puts "2 - Mark order as delivered"
    print_shared_options
  end

  def print_manager_options
    puts "------------------------------"
    puts "------------ MENU ------------"
    puts "------------------------------"
    puts "What do you want to do"
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    print_shared_options
  end

  def manager_action(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then logout
    when 9 then @running = false
    else
      puts "Try again.. Your choice is not valid."
    end
  end

  def delivery_guy_action(choice)
    case choice
    when 1 then @orders_controller.list_delivery_guy_orders
    when 2 then @orders_controller.mark_order_as_delivered
    when 8 then logout
    when 9 then @running = false
    else
      puts "Try again.. Your choice is not valid."
    end
  end

  def logout
    @current_user = nil
  end
end

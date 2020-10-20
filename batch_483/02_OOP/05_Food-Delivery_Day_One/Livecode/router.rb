class Router 
 def initialize(meals_controller, customers_controller)
   @running = true
   @meals_controller = meals_controller
   @customers_controller = customers_controller
 end

 def run
    while @running
      display_tasks
      user_choice = gets.chomp.to_i
      call_to_action(user_choice)
    end
 end

 def display_tasks
  puts "------------------------------"
  puts "------------ MENU ------------"
  puts "------------------------------"
  puts "What do you want to do"
  puts "1 - List all meals"
  puts "2 - Add a meal"
  puts "3 - List all customers"
  puts "4 - Add a customer"
  puts "5 - Edit a meal"
  puts "9 - Quit"
  print "> "
 end

  def call_to_action(choice)
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
      @meals_controller.edit
    when 9
      @running = false
    else
      puts 'Choose another one....'
    end
  end
end
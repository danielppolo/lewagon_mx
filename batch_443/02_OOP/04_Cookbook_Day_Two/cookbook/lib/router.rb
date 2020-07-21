class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the cookbook"
    while @running do
      puts "Type a number:"
      display_menu
      user_intention = gets.chomp.to_i
      print `clear`
      dispatch(user_intention)
    end
  end

  def dispatch(user_input)
    case user_input
    when 1 then @controller.list
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.import
    when 5 then @controller.mark_as_done
    when 0 then @running = false
    end
  end

  def display_menu
    puts "1. List Recipe"
    puts "2. Add recipe"
    puts "3. Remove a recipe"
    puts "4. Import recipes from the Internet"
    puts "5. Mark a recipe as done"
    puts "0. To quit"
  end
end

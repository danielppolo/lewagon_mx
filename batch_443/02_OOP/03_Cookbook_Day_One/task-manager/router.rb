class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    puts "Welcome to the task manager"
    loop do
      puts "What do you want to do? [type a number]"
      display_menu
      user_intention = gets.chomp.to_i

      case user_intention
      when 1 then @controller.add_task
      when 2 then @controller.list_tasks
      when 3 then @controller.mark_as_done
      when 4 then @controller.remove_task
      when 0 then break
      end
    end
  end

  def display_menu
    puts "1. Add Task"
    puts "2. List Tasks"
    puts "3. Mark a task as done"
    puts "4. Remove a task"
    puts "0. To quit"
  end
end

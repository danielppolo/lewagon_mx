class TasksView
  def ask_for_title
    puts "What do you want to do?"
    return gets.chomp
  end

  def ask_for_index
    puts "What's number?"
    gets.chomp.to_i - 1
  end

  def list(tasks)
    # tasks => [] of Task instances
    tasks.each_with_index do |task, index|
      # task => Task instance
      x = task.done? ? "[x]" : "[ ]"
      puts "#{index + 1}. #{x} #{task.title}"
    end
  end
end

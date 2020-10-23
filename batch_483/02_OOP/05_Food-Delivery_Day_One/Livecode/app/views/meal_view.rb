class MealView

  def display_list(array_of_meals)
    array_of_meals.each_with_index do |meal_instance, index|
      puts "#{index + 1} - #{meal_instance.name}"
    end
  end

  def display(thing)
    puts "Please enter a #{thing}:"
    return gets.chomp
  end
  
end
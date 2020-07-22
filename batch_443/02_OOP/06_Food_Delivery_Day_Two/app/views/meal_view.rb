class MealView
  def ask_name
    # ask the user for a name
    puts "What's the name of the meal"
    # get the user input
    gets.chomp
  end

  def ask_price
    # ask the user for a name
    puts "What's the price of the meal"
    # get the user input
    gets.chomp.to_i
  end

  def display_all(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} -  $#{meal.price}"
    end
  end
end

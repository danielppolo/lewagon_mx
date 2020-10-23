class View

  def list(array_of_recipes)
    array_of_recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name}, #{recipe.description}"
    end
  end

  def ask(thing)
    puts "Please enter a #{thing}"
    return gets.chomp
  end

  def choose
    puts "Please select a number"
    gets.chomp.to_i
  end
  
end
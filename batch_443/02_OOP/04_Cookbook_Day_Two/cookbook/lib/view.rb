class View
  def display_recipes(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{ recipe.done? ? 'X' : ' '}] #{recipe.name}: (#{recipe.prep_time} minutes)"
    end
  end

  def print(string)
    puts string
  end

  def ask_for_string(input_name)
    puts "What's the #{input_name}?"
    gets.chomp
  end

  def ask_for_integer(input_name)
    puts "What's the #{input_name}?"
    gets.chomp.to_i
  end

  def ask_for_index
    puts "What's the number?"
    gets.chomp.to_i - 1
  end

  def ask_for_ingredient
    puts "What ingredient would you like a recipe for?"
    gets.chomp
  end
end

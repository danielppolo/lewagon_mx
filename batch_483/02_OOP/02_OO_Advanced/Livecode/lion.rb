require_relative 'animal'

class Lion < Animal

  def talk
    puts "#{@name} roars!"
  end

  def eat(food)
    "#{super(food)}. Law of the Jungle!"
  end
end
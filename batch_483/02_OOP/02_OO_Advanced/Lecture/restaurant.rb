# Restaurant with name, city, capacity, category

class Restaurant #PascalCase

  attr_reader :name, :capacity
  attr_accessor :city, :category

  def initialize(name, city, capacity, category)
    @name = name
    @city = city
    @capacity = capacity
    @category = category
  end

  # # Getter for name
  # def name
  #   @name
  # end

  # # Getter for city
  # def city
  #   @city
  # end

  # #Setter for city
  # def city=(new_city)
  #   @city = new_city
  # end

  # # Getter for capacity
  # def capacity
  #   @capacity
  # end

  # # Setter for capacity
  def capacity=(new_capacity)
    puts "Previous capacity was #{@capacity}"
    @capacity = new_capacity
    puts "Upgraded to #{@capacity}"
  end

  # # Getter for category
  # def category
  #   @category
  # end

  # # Setter for category
  # def category=(new_category)
  #   @category = new_category
  # end
end



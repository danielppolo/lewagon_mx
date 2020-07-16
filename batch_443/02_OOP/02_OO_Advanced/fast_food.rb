require_relative 'restaurant'

class FastFood < Restaurant
  attr_reader :preparation_time

  def initialize(name, city, preparation_time)
    @name             = name
    @city             = city
    @preparation_time = preparation_time
    @customers        = []
  end

  def print_customers
    # super checks the name of the method
    # it goes to the same method on the superclass
    # executes the code from parent
    # and returns the results
    puts "---------#{@name}---------"
    super
    puts "--------------------------"
  end
end

dominos = FastFood.new('Dominos', 'CDMX', 5)

# # p dominos.preparation_time

# dominos.add_reservation('Joyce Martinez')
# dominos.add_reservation('Pedro Cobos')
# dominos.add_reservation('Ben Cea')

# dominos.print_customers

dominos.example

require_relative 'restaurant'

class FancyRestaurant < Restaurant
  attr_reader :michelin_stars

  def initialize(name, city, michelin_stars)
    @name             = name
    @city             = city
    @michelin_stars   = michelin_stars
    @customers        = []
  end


  def print_customers
    puts 'You dont have access to our michelin star customer list'
  end
end


puyol = FancyRestaurant.new('Puyol', 'CDMX', 2)

puyol.add_reservation('Joyce Martinez')
puyol.add_reservation('Pedro Cobos')
puyol.add_reservation('Ben Cea')


puyol.print_customers



class SuperClass
  # all data / behavior 
end


class SubClass < SuperClass
end







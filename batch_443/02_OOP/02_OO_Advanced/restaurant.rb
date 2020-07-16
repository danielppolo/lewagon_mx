class Chef
  attr_accessor :name, :years, :restaurant
              #string  #int   # instance of Restaurant
  def initialize(name, years, restaurant)
    @name       = name
    @years      = years
    @restaurant = restaurant
  end
end

class Restaurant
  attr_reader :customers
  attr_accessor :name, :chef
  # Data/State
  def initialize(name, city, capacity, category, chef_name, chef_years)
    @name       = name
    @city       = city
    @capacity   = capacity
    @category   = category
    @customers  = []
    @chef       = Chef.new(chef_name, chef_years, self)
  end

  # Behavior        -    String
  def add_reservation(customer_name)
    @customers << customer_name
  end

  def closed?
    !open?
  end

  def open?
    Time.now.hour > 18 && Time.now.hour < 22
  end

  def print_customers
    @customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer}"
    end
  end

  # Self refers to the class
  def self.categories
    ['Fast Food', 'Fancy Food', 'General']
  end

  def addition
    p 2 + 2
  end
end
# p pizza_hut.name 
# pizza_hut.name = 'Pizza Hut Insurgentes'
# p pizza_hut.name

# p pizza_hut.customers
pujol = Restaurant.new('Pujol', 'CDMX', 5, 'Very fancy author food', 'Enrique Olvera', 30)

p pujol.chef
# # p 'The reservation state on creation:'
# p puyol.customers
# puyol.add_reservation('Francisco Aguilar')
# # p puyol.customers

# p puyol.open?
# p 'Is puyol closed?'

# p Restaurant.categories
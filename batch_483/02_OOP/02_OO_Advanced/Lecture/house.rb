require_relative 'building.rb'

class House < Building

  def self.price_per_square_meter(city)
    case city
    when "Paris" then 9000
    when "Brussels" then 3000
    else 0
    end
  end
  
  def initialize(name, width, length, city)
    super(name, width, length)
    @city = city
  end


  def price
    # Floor area 
    area = floor_area() #Integer #100
    #Price per square meter
    price_per_meter = House.price_per_square_meter(@city) #Integer #9000
    # Return floor area * price per square meter
    return area * price_per_meter #9000 * 100
  end

  def what_is_self
    return self
  end

end


class Meal
  attr_accessor :id
  attr_reader :name, :price

  def initialize(attrs = {})
    @id    = attrs[:id] # Data type: Integer
    @name  = attrs[:name] # Data type: String
    @price = attrs[:price] # Data type: Integer
  end
end

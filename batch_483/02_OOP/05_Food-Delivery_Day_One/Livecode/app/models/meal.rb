class Meal
  attr_accessor :id, :name, :price

  def initialize(attributes = {})
    @name = attributes[:name] || ''
    @id = attributes[:id]
    @price = attributes[:price] || 0
  end

  def to_s
    "#{@name} ($#{@price})"
  end
end
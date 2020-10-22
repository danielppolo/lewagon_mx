class Customer
  attr_accessor :id, :name, :address
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end

  def to_s
    "#{@name}, located in #{@address}"
  end
end
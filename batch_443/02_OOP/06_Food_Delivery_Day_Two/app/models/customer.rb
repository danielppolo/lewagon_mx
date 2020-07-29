class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attrs = {})
    @id      = attrs[:id] # Data type: Integer
    @name    = attrs[:name] # Data type: String
    @address = attrs[:address] # Data type: Integer
  end
end

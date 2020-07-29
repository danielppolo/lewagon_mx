class Order
  attr_accessor :id
  attr_reader :meal, :employee, :customer

  def initialize(attrs = {})
    @id        = attrs[:id] # Data type: Integer
    @meal      = attrs[:meal] # Data type: Meal instance
    @customer  = attrs[:customer] # Data type: Customer instance
    @employee  = attrs[:employee] # Data type: Employee instance
    @delivered = attrs[:delivered] || false # Data type: Boolean
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end

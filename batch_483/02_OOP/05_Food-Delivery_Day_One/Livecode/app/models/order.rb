class Order

  attr_accessor :id, :meal, :customer, :employee
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def to_s
    "#{@meal.name} for #{@customer.name} delivered by #{@employee.username}"
  end
end
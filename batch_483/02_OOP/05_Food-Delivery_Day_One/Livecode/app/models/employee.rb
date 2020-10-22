class Employee

  attr_reader :role, :password
  attr_accessor :id, :username

  def initialize(attributes = {})
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role] || 'delivery_guy'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  def manager?
    @role == 'manager'
  end

  def to_s
    "#{@username} working as #{@role}"
  end
end



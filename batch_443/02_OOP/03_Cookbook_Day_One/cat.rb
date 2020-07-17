class Cat
  attr_reader :name

  def initialize(name)
    # Data
    @name = name
    @sleeping = true
  end

  def sleeping?
    @sleeping
  end

  def wake_up!
    @sleeping = false
  end
end

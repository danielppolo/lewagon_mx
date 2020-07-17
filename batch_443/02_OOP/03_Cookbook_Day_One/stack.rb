class Stack
  def initialize
    @plates = []
  end

  def add(plate)
    @plates.push(plate)
  end

  def remove
    @plates.pop
  end
end

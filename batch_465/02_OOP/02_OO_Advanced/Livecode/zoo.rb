class Zoo
  attr_reader :animals, :name
  def initialize(name)
    @name = name
    @animals = []
  end

  def add_animal(animal)
    @animals.push(animal)
  end
end

class Animal
  def self.phyla
    %w[Nematomorpha Priapula Trilobitomorpha Nematoda]
  end

  def initialize(name)
    @name = name
  end

  def talk
    "#{name} makes a sound"
  end

  def eat(food)
    "#{name} eats a #{food}."
  end

  def assign_zoo(zoo) # Zoo
    puts "Self is this: #{self}"
    zoo.add_animal(self)
    puts "#{name} was inserted into the #{zoo.name}"
  end

  attr_reader :name
end

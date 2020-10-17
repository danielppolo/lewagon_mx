class Animal

  attr_reader :name

  def self.phyla
    %w[Deuterostomia Ecdysozoa Lophotrochozoa Radiata]
  end

  def initialize(name)
    @name = name
  end

  def talk
    puts "#{@name} makes sound!" 
  end

  def eat(food)
    "#{@name} eats a #{food}"
  end

end

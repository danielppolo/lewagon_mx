require_relative 'building.rb'

class Castle < Building
  attr_accessor :butler
  attr_reader :built_year
  @@names = []

  def self.categories
    return ['Medieval', 'Norman', 'Ancient']
  end

  def self.names
    return @@names
  end


  def initialize(name, width, length, built_year)
    super(name, width, length)
    @built_year = built_year
    
    @@names.push(self)
  end

  def floor_area
    puts "Method in Castle"
    super() + 300
  end

  def has_a_butler?
    @butler != nil
  end

  def to_s
    return "#{@name} (#{@built_year})"
  end
end
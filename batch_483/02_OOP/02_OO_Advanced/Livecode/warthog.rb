require_relative 'animal'

class Warthog < Animal

  def talk
    puts "#{@name} grunts!"
  end
end
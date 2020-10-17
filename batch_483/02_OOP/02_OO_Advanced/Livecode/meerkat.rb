require_relative 'animal'

class Meerkat < Animal

  def self.phyla
    %w[Timonzoa Ecdysozoa Lophotrochozoa Radiata]
  end

  def talk
    puts "#{@name} barks!"
  end
end
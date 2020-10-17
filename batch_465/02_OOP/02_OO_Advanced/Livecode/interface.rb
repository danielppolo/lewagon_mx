require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

simba = Lion.new('Simba')
nala = Lion.new('Nala')
timon = Meerkat.new('Timon')
pumbaa = Warthog.new('Pumbaa')
animals = [simba, nala, timon, pumbaa]

animals.each do |animal|
  puts animal.talk
end

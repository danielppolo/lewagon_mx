require_relative "cat"

chuvisco = Cat.new("Chuvisco")

puts "#{chuvisco.name} is currently:"
puts "#{chuvisco.sleeping? ? "Sleeping" : "Awake"}"

chuvisco.wake_up!

puts "#{chuvisco.name} is currently:"
puts "#{chuvisco.sleeping? ? "Sleeping" : "Awake"}"

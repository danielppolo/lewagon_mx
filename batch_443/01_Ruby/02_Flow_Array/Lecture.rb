# Conditionals
puts 'Enter your age'
age = gets.chomp.to_i

if age >= 18
  puts 'You can vote'
else
  puts 'Sorry, you cannot vote'
end

puts 'Bye 👋'

# Ternary operators
puts 'heads or tails?'
user_input = gets.chomp

computer_input = ['heads', 'tails'].sample

puts user_input == computer_input ? 'Win' : 'Loose' 


# Multiple conditionals
time = Time.now.hour

if time < 12
  puts 'Good morning'
elsif time > 12 && time < 20
  puts 'Good afternoon'
elsif time >= 20
  puts 'Good evening'
else
  puts 'Lunch time'
end

# Case statement
puts 'What do you want to do? [WRITE, READ, DELETE]'
input = gets.chomp

case input
when 'WRITE'
  puts 'You are in writting mode'
when 'READ'
  puts 'You are in reading mode'
when 'DELETE'
  puts 'You are in deleting mode'
else
  puts 'Wrong action!'
end

# 
if action == 'WRITE'
  puts 'You are in writting mode'
elsif action == 'READ'
  puts 'You are in reading mode'
elsif action == 'DELETE'
  puts 'You are in deleting mode'
else
  puts 'Wrong action!'
end

#  Inline conditions
puts 'Enter a number'
number = gets.chomp.to_i

puts "#{number} is even" if number.even?


# Looping with until
price_to_find = rand(1..5)
choice = nil

until choice == price_to_find
  puts  'Enter a number between 1 and 5'
  choice = gets.chomp.to_i
end

puts 'Goodbye 👋'

# Looping with loop (dangeruous)
price_to_find = rand(1..5)
choice = nil

loop do 
  puts 'Enter a number between 1 and 5'
  choice = gets.chomp.to_i
  next if choice.odd?

  puts 'The number is even'
end

puts 'Goodbye 👋'


# Iterators
beatles = ["john", "ringo", "george", "paul"]

beatles.each do |beatle|
  puts "#{beatle} is in the Beatles"
end
 
puts 'Those were the Beatles'
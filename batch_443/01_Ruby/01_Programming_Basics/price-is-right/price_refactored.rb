min_guess = 1
max_guess = 100_000 # Feel free to add about millions zeros more =D

computer_price = rand(min_guess..max_guess)
guessed_price = nil

tries_counter = 0

puts "Welcome to Wagon's Price is Right!!!"
until guessed_price == computer_price
  guessed_price = (min_guess + max_guess) / 2
  tries_counter += 1

  puts "Try again!"
  if computer_price > guessed_price
    puts "Go higher!"
    min_guess = guessed_price
  else
    puts "Go lower!"
    max_guess = guessed_price
  end
end

puts "Congratulations! It was indeed #{guessed_price}!"
puts "You got in #{tries_counter} tries!"
puts "I hope to see you again soon!"

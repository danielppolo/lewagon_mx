puts "Welcome to Wagon's Price is Right!!!"

min_guess = 1
max_guess = 100_000 # Feel free to add about millions zeros more =D
computer_price = rand(min_guess..max_guess)
tries_counter = 0

loop do
  guessed_price = (min_guess + max_guess) / 2
  tries_counter += 1

  if guessed_price == computer_price
    puts "Congratulations! It was indeed #{guessed_price}!"
    break
  else
    puts "Try again!"
    if computer_price > guessed_price
      puts "Go higher!"
      min_guess = guessed_price
    else
      puts "Go lower!"
      max_guess = guessed_price
    end
  end
end

puts "You got in #{tries_counter} tries!"
puts "I hope to see you again soon!"

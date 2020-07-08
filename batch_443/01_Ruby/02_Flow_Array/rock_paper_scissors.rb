OPTIONS = ['rock', 'paper', 'scissors']
# Random computer input
computer_input = OPTIONS.sample
player_response = nil

until OPTIONS.include?(player_response)
  # Display the options
  puts 'Pick a one [rock, paper, scissors]'
  # Choosing an option 
  player_response = gets.chomp.downcase
end

puts "Your choice is #{player_response}, computer's choice #{computer_input}"

# Evaluate both options
if player_response == 'rock'
  outcome = computer_input == 'scissors'
elsif player_response == 'scissors'
  outcome = computer_input == 'paper'
elsif player_response == 'paper'
  outcome = computer_input == 'rock'
end

# Give a result
if player_response == computer_input
  puts "It's a draw! Try again."
elsif outcome
  puts 'You won'
else
  puts 'You lost'
end
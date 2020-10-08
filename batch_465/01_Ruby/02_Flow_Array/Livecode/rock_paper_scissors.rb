# > Enter your pick (rock, paper or scissors)
# >
# > Calculating the outcome....
# > Your pick was ``paper``, the computer picked `rock`
# > You win!
OPTIONS = %w[rock paper scissors].freeze

# We need define the winning rules
def win?(user_input, computer_input)
  outcome = false
  if user_input == 'rock'
    outcome = computer_input != 'paper'
  elsif user_input == 'scissors'
    outcome = computer_input != 'rock'
  elsif user_input == 'paper'
    outcome = computer_input != 'scissors'
  end
  outcome
end

# INTERFACE STARTS 👇
begin
  # Enter instructions for the user to input a choice
  puts 'Enter your pick (rock, paper or scissors)'
  # The user enters the input
  user_choice = gets.chomp.downcase
end until OPTIONS.include?(user_choice)
# Computers chooses a random option
computer_choice = OPTIONS.sample

# Evaluate the choices. #=> Boolean
puts "Your pick was #{user_choice}, the computer picked #{computer_choice}"
if user_choice == computer_choice
  puts 'It\'s a tie'
else
  result = win?(user_choice, computer_choice)
  # Print the output based on the previous boolean. You win or you loose
  puts result ? 'You win' : 'You loose'
end

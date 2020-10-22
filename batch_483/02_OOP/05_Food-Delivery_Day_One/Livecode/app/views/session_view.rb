require 'io/console'

class SessionView
  def display(thing)
    puts "Enter your #{thing}:"
    return gets.chomp
  end

  def get_password
    IO::console.getpass "Enter your password: "
  end
  
  def welcome(name)
    puts "Welcome #{name}!"
  end

  def wrong_credentials
    puts "Wrong credentials... Try again!"
  end
end


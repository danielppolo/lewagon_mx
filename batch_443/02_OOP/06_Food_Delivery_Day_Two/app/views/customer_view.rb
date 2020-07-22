class CustomerView
  def ask_name
    # ask the user for a name
    puts "What's the name of the customer"
    # get the user input
    gets.chomp
  end

  def ask_address
    # ask the user for an address
    puts "What's the address of the customer"
    # get the user input
    gets.chomp
  end

  def display_all(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end
end

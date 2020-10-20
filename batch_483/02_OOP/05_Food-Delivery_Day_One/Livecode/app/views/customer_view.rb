class CustomerView

  def display_list(array_of_customers)
    array_of_customers.each_with_index do |customer_instance, index|
      puts "#{index + 1} - #{customer_instance.name}"
    end
  end

  def display(thing)
    puts "Please enter a #{thing}:"
    return gets.chomp
  end
  
end
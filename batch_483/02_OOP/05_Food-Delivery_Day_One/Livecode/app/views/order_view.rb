class OrderView
  def display(list)
    list.each_with_index do |item, index|
      puts "#{index + 1} #{item}"
    end
  end

  def ask(thing)
    puts "Please select the number for the #{thing}:"
    gets.chomp.to_i
  end

  def separator
    puts "--------------------------"
  end
end
def test_yield(number)
  value_from_block = yield(number) # => 25
  puts "The returned value from the block is #{value_from_block.inspect}"
end


test_yield(5) do |number|
  puts "The number in the block is #{number}"
  total = number * number
  puts "The block returned #{total}" # => nil
  total
end
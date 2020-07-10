require_relative 'frequencies'

# Enter the file
content = File.read('dummy.txt')
# Read file

# Pass the content of the file to method
count = frequencies(content)
# Convert a hash into array
sorted_count = count.sort_by do |key, value|
  value
end.reverse
# Iterate through it and sort it
sorted_count.each do |key, value|
  puts "#{value} - #{key}"
end
# Print the results
# GOAL 👇
# 20 - Dog
# 18 - the
# 15 - Cat
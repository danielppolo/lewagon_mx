require "date"

def days_until_christmas
  # 1. find today's date
  today = Date.today
  # 2. find christmas date
  #                    year, month, day
  xmas_date = Date.new(2020, 12, 25)
  # 3. subtract them
  (xmas_date - today).to_i
end

puts "Returns an integer:"
puts days_until_christmas.class == Integer

puts "Returns the correct number of days:"
puts days_until_christmas == 171

puts "Actual:"
p days_until_christmas

# 3 WAYS OF DECLARING A HASH

# 1. With strings as keys
students = {
  "Peter" => [21, 'Mexico'],
  "Mary" => [22, 'USA'],
  "George" => [24, 'UK'],
  "Emma" =>  [25, 'Brazil'],
}

# 2. With symbols as keys
students_as_symbols = {
  :Peter => [21, 'Mexico'],
  :Mary => [22, 'USA'],
  :George => [24, 'UK'],
  :Emma => [25, 'Brazil'],
}

# 3. With symbols as keys in a simpler way
students_as_symbols_new = {
  Peter: [21, 'Mexico'],
  Mary: [22, 'USA'],
  George: [24, 'UK'],
  Emma: [25, 'Brazil'],
}


# Accessing the country of Mary. 
mary = students['Mary'] # => [22, USA]
# Accessing => Hash => Array
puts students['Mary'][1]


# If we were storing hashes for each student
students_as_symbols_new = {
  Peter: {
    age: 21,
    country: 'Mexico'
  },
  Mary: {
    age: 22,
    country: 'USA'
  },
  George: {
    age: 24,
    country: 'UK'
  },
  Emma: {
    age: 25,
    country: 'Brazil'
  },
}

# Accessing the country of Mary. 
puts mary['country']
# Accessing => Hash => Hash
puts students['Mary']['country']


# Iteration through Hashes
students_age.each do |key, value|
  puts "#{key} is #{value}"
end


# Hashes as last argument.
# PRO: You can pass infinite data inside the Hash avoiding the restriction of the number of arguments.
def tag(html_tag, content, attributes = {})
  
  html_attributes = attributes.map do |key, value|
    "#{key}=\"#{value}\""
  end

  "<#{html_tag} #{html_attributes.join(' ')}>#{content}</#{html_tag}>"
end


puts tag("h1", "Hello world") #👈
# => <h1>Hello world</h1>

puts tag("h1", "Hello world", { class: "bold" })
# # => <h1 class='bold'>Hello world</h1>

puts tag("a", "Le Wagon",  href: "http://lewagon.org", class: "btn")
puts tag("a", "Le Wagon",  { href: "http://lewagon.org", class: "btn" })
# => <a href='http://lewagon.org' class='btn'>Le Wagon</a>




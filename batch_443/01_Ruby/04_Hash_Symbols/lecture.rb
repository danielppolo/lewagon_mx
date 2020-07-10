# students = {
#   "Peter" => [21, 'Mexico'],
#   "Mary" => [22, 'USA'],
#   "George" => [24, 'UK'],
#   "Emma" =>  [25, 'Brazil'],
# }

# students_as_symbols = {
#   :Peter => [21, 'Mexico'],
#   :Mary => [22, 'USA'],
#   :George => [24, 'UK'],
#   :Emma => [25, 'Brazil'],
# }

# students_as_symbols_new = {
#   Peter: [21, 'Mexico'],
#   Mary: [22, 'USA'],
#   George: [24, 'UK'],
#   Emma: [25, 'Brazil'],
# }


# Peter:


# mary = students['Mary'] # => [22, USA]
# puts students['Mary'][1]
# puts mary['country']
# puts students['Mary']['country']

# students_age.each do |key, value|
#   puts "#{key} is #{value}"
# end



# puts students_age["Peter"] # => 25, 'Mexico' 



# def tag(html_tag, content, attributes = {})
#   # attributes => { class: "bold" }
#   # html_attributes = "class=\"#{attributes[:class]}\""# => 'class="bold"'
#   html_attributes = attributes.map do |key, value|
#     "#{key}=\"#{value}\""
#   end

#   "<#{html_tag} #{html_attributes.join(' ')}>#{content}</#{html_tag}>"
# end


# puts tag("h1", "Hello world") #👈
# # => <h1>Hello world</h1>

# puts tag("h1", "Hello world", { class: "bold" })
# # # => <h1 class='bold'>Hello world</h1>

# puts tag("a", "Le Wagon",  href: "http://lewagon.org", class: "btn")
# puts tag("a", "Le Wagon",  { href: "http://lewagon.org", class: "btn" })
# # => <a href='http://lewagon.org' class='btn'>Le Wagon</a>




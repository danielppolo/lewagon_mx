def acronymize(sentence = '')
  # 1. Split the sentence into different words
  return nil if sentence.length == 0

  acronym = ''
  words = sentence.split(' ') # Array
  # 2. Find the [0] for each
  words.each do |word|
    acronym += word[0].upcase
  end 
  # 3. Create a new string with those letters
  acronym
end



#  TEST
puts acronymize('For your information') == 'FYI' # => true
puts acronymize('what the fuck') == 'WTF' # => true
puts acronymize('WORLD WIDE WEB') == 'WWW' # => true
puts acronymize('i dont Know') == 'IDK' # => true
puts acronymize('') == nil # => true
puts acronymize() == nil # => true
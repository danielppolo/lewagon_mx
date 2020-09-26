def acronymize(sentence)
  return nil if sentence == '' # GUARDS

  acronym = ''
  # Break sentence into words
  words = sentence.split(' ')
  # Take the first letter of each word.
  # From each element in the array, we take [0] of each word.
  words.each do |word|
    # All to uppercase
    acronym += word[0].capitalize
  end
  # We join all the first letters into a String
  # RETURN ACRONYM
  acronym
end

puts acronymize('World wide web')
puts acronymize('For your information')
puts acronymize('  For your information   ')
puts acronymize('')

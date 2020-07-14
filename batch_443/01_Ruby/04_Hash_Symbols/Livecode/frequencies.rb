# 'The lazy dog jumped over the brown fox'

def frequencies(str = '')
  count = {}
  # Get the text, delete special characters and then split into an array
  words = str.delete('*,.-_').split.reject do |word|
    # Rejecting words less than 3 chars.
    word.length <= 3
  end
  
  # Iterate through words to create keys in the Hash `count`
  words.each do |word|
    # To downcase to make it insensitive
    word_downcased = word.downcase
    # Check if the word is already in the Hash `count`
    if count[word_downcased] # == count.key?(word_downcased)
      count[word_downcased] += 1
    else
      count[word_downcased] = 1
    end
  end
  return count
end

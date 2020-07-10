# 'The lazy dog jumped over the brown fox'

def frequencies(str = '')
  count = {}
  words = str.delete('*,.-_').split.reject do |word|
    word.length <= 3
  end
  words.each do |word|
    word_downcased = word.downcase
    if count[word_downcased] # count.key?(word_downcased)
      count[word_downcased] += 1
    else
      count[word_downcased] = 1
    end
  end
  return count
end

def encrypt(sentence)
  #  0. Guard for sentence as empty string.
  return "" if sentence == ""
  alphabet = ("A".."Z").to_a
  #  1. Break sentence into array of chars. => Array
  chars = sentence.chars
  #  2. Iterate in my array (map) => Array
  encrypted_sentence = chars.map do |letter| # String
    if letter == " "
      letter
    else
      #  3. Get the index in the aplhabet array. => Integer 
      letter_index = alphabet.index(letter) # => Integer
      #  4. Substract -3 to the index
      target_index = letter_index - 3
      #  5. Block return the letter with this new index
      alphabet[target_index]
    end
  end
  # => Array with new letters
  #  5. Join the array with new letters => String
  encrypted_sentence.join
end

encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")

# CONDITIONS
# 1. "returns an empty string when passed an empty string"
# 2. "returns the 3-letter backward-shifted text" 

# Expect: "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"
# Result: "QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD"

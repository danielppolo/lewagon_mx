def acronymize(sentence) # String
  return "" if sentence == "" # GUARD

  # 1. Split the sentence in blank spaces. => Array
  words = sentence.split(" ")
  # 2. Iterate through the array (.map)
  letters = words.map do |word|
    # 3. Get the first letter (.first)
    word[0]
  end
  # 4. New array and .join it!
  return letters.join.upcase
  # Return String. Acronym.
end

acronymize("for your information")
# CONDITIONS
# 1. "returns an empty string when passed an empty string" 
# 2. "returns the acronym on downcased sentences"
# 3. "returns the acronym on upcased sentences"

def palindrome?(string)
  a = string.scan(/[a-zA-Z]/).join().downcase
  b = a.reverse
  return a == b
end

def count_words(string)
  words = Hash.new
  string.split().each do |str|
    a = str.scan(/[a-zA-Z]/).join().downcase
    if a.length > 0
      if words.key?(a)
        words[a] += 1
      else
        words[a]  = 1
      end
    end
  end
  return words
end

#puts palindrome?("A man, a plan, a canal -- Panama")
#puts palindrome?("Madam, I'm Adam!")
#puts palindrome?("Abracadabra")

#puts count_words("A man, a plan, a canal -- Panama")

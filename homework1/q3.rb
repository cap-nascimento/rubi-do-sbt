def combine_anagrams(words)
  groups = Hash.new
  words.each do |str|
    a = str.chars.sort.join
    if !groups.key?(a)
      groups[a] = []
    end
    groups[a] << str
  end
  return groups.values
end

# combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])

def combine_anagrams(words)
	sorted_words = words.map{|word| word.chars.sort.join}
end

combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])

["acrs", "for", "aeoopstt", "acrs", "foru", "acrs", "acemrs", "acemrs"]

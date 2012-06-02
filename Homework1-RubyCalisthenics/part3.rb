def combine_anagrams(words)
	actual_words = words
	sorted_words = words.map{|word| word.chars.sort.join}

	anagrams_map={}
		
	# create a map in which key will be the sorted word and value will be array of words that sort to form the sorted word.
	# i.e {"acrs" => ["cars", "racs","scar"], "for" => [for], "aeoopstt" => ["potatoes"], "foru" => ["four"]}
	sorted_words.each_with_index do |word, index|
        if anagrams_map.has_key?(word)
			anagrams_map[word] << actual_words[index]
		else	 	
			anagrams_map[word] = Array.new
			anagrams_map[word] << actual_words[index]
		end	
	end
	
	anagrams_map.values.inject([]){|list,| list<<value}
	
end

# p combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])

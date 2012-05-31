def palindrome?(string)
	words = string.gsub(/\W/, '').downcase
	if words == words.reverse
		true
	else
		false
	end		
end 


def count_words(string)
	words = string.downcase.scan(/\w+/)
	count_list = {}
	words.each do |word|
		if count_list.has_key?(word)
			count_list[word] = count_list[word] + 1
		else
			count_list[word] = 1
		end		
	end
	count_list
end

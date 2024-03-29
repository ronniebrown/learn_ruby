
	def echo(word)
		word
	end

	def shout(word)
		word.upcase
	end

	def repeat(word, times = 2)
		([word] * times).join(" ")
	end

	def start_of_word(word, n)
		word[0...n]
	end

	def first_word(word)
		word.split(" ").first
	end

	def titleize(s)
  words = s.split.map do |word|
    if %w(the and over).include?(word)
      word
    else
      word.capitalize
    end
  end
  words.first.capitalize!
  words.join(" ")
end
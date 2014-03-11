
class Book
	def title(s)
	new_title = []
		s.split.map do |word|
		  if %w{the and a of an in}.include?(word)
		  	new_title << word
		  else
		  	new_title << word.capitalize
		  end
		end
		new_title.first.capitalize!
		new_title.join(" ")
	end
end



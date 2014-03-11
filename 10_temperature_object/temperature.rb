class Temperature


	def ftoc(temp)
		(temp - 32.0) * (5.0/9.0)
	end

	def ctof(c)
		c * (9.0/5.0) + 32
	end
end
	
class Farenheit < Temperature
end

class Celcius < Temperature
end

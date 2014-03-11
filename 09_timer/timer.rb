class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		minutes = @seconds/60
		hours = @seconds/3600
		sprintf("%02d:%02d:%02d", hours, minutes, seconds)
	end
end
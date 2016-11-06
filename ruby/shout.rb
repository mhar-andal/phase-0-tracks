
module Shout
	def self.yell_angrily(words)
		words = words + "!!!" + " :("
		puts words
	end

	def self.yelling_happily(words)
		words = words + "!!!" + " :)"
		puts words
	end
end

Shout.yell_angrily("Hello")
Shout.yelling_happily("Happy")

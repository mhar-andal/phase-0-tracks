module Shout
	def chirp(int)
		int.times do 
			puts "Chirp!"
		end
	end
	
	def jumpForJoy
		puts "*jumping for joy*"
	end
end

class Bird
	include Shout
end

class Cricket
	include Shout
end

bird = Bird.new
bird.chirp(1)
bird.jumpForJoy

cricket = Cricket.new
cricket.chirp(3)
cricket.jumpForJoy

=begin
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
=end
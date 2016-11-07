class WordGame
	attr_reader :word, :secret_word

	def initialize(word)
		@word = word
		@split_word = word.split('')
		@secret_word = word.split('').each {|x| x = '_' }
		@guess_count = 0
		@game_over = false
	end

	def guess(char)
		if @word.include?(char)
			index = 0
			@split_word.length.times do 
				if @split_word[index] == char
					@secret_word[index] = char
				end		
			index += 1
			end
		end

		@guess_count += 1
	end
end



class WordGame
	attr_reader :word, :secret_word

	def initialize(word)
		@word = word
		@split_word = word.split('')
		@secret_word = word.split('').each {|x| x = '_' }
		@guess_count = 0
		@game_over = false
	end

end



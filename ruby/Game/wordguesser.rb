class WordGame
	attr_reader :word, :secret_word, :game_over

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

	def checkGuess
		if @guess_count == @split_word.length
			@game_over = true
		else
			false
		end
	end

	def checkGameOver
		if @word == @secret_word.join('')
			@game_over = true
		end
	end

	def printSecretWord
		@secret_word.each {|x| print x}
	end
end


puts "Player 1 please enter your secret word!(DON'T LOOK PLAYER 2)"
secretword = gets.chomp

100.times do 
	puts "-------------------------------HIDING ANSWER--------------------------------------"
end

game = WordGame.new(secretword)

while !game.game_over
	game.printSecretWord
	puts "Player 2 enter your guess: "
	char = gets.chomp
	game.guess(char)
	game.checkGuess
	game.checkGameOver
end


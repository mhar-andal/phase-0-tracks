class WordGame
	attr_reader :word, :secret_word, :game_over

	def initialize(word)
		@word = word
		@split_word = @word.split('')
		@secret_word = @word.split('')
		@secret_word.map!{|x| x = '_' }
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
		puts "Guess Count: #{@guess_count}"

		if @word == @secret_word.join('')
			@game_over = true
			puts "--------------------------------------------------------------------------------------------"
			print "Secret word is: "
			print @secret_word.join('')
			puts
			puts "Congrats you won!!!!!!"

		elsif @guess_count == @split_word.length
			@game_over = true
			puts "Man you lost, looks like you are a sore loser FOREVER HAHAHAHAHA"

		else
			false
		end
	end


	def printSecretWord
		@secret_word.each{|x| print "#{x} "}
		puts
	end
end

puts "Player 1 please enter your secret word!(DON'T LOOK PLAYER 2)"
secretword = gets.chomp

100.times do 
	puts "-------------------------------HIDING ANSWER--------------------------------------"
end

game = WordGame.new(secretword)

while !game.game_over
	puts "--------------------------------------------------------------------------------------------"
	game.printSecretWord
	puts "Player 2 enter your guess: "
	char = gets.chomp
	game.guess(char)
	game.checkGuess
end
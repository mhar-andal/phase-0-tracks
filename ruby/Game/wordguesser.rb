=begin
	---------CODE DESIGN---------
- Initilize class with 4 methods
	- First method will initialize the values.
		-Sets up variables with the word, word but split up, and secret word that is word with every letter replaced with _
	- Second method will check if guess is correct
		-If they secret word contains the guess, dont count the guess
	- Third method will check guess. 
		-If word is equal to secret word then player won and congratulate
		-If word is not equal and guess count is equal to word length, then player lost. Send them loser taunt
	- Fourth method will print each secret word character with a space following
- Write driver code to ask player 1 for a word, then ask player 2 to start guessing. Will run until game over is true

=end

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
				if @secret_word[index] == char
					puts "You already guess #{char}!"
					@guess_count -= 1
				elsif @split_word[index] == char
					@secret_word[index] = char
				end		
			index += 1
			end
		end

		@guess_count += 1

		return @secret_word.join('') #RETURN FOR RSPEC TEST
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
			@game_over = false
		end

		return @game_over #RETURN FOR RSPEC TEST
	end

	def printSecretWord
		@secret_word.each{|x| print "#{x} "}
		puts
	end
end

#DRIVER CODE
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
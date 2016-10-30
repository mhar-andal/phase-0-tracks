=begin 

ROBOT TRANSLATOR
If a letter is capitalized and it's in the first half of the alphabet, it becomes "bloop".

Otherwise, if a letter is capitalized or it's the letter "e", it becomes "Buzz"

If it's not a letter at all, it becomes boing

Otherwise it becomes beep

=end

def robotinator(phrase)
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	p_length = phrase.length

	#BLOOP
	index = 0
	while index < p_length
		count = 0

		puts "First Phrase: #{phrase}"
		puts "Index: #{index}" #3
		puts "Length: #{p_length}" #$
			if phrase[index] == alphabet[count].upcase && phrase[index].upcase != "E"
				phrase[index] = "bloop"
				count = 14
				index = index + 5
				p_length = phrase.length
				count += 1
			else
				count += 1
			end
		end


		#BUZZ
		count = 13
		while count < 26
			if phrase[index].upcase == "E" || phrase[index] == alphabet[count].upcase
				phrase[index] = "buzz"
				count = 27
				index = index + 3
				p_length = phrase.length
				count += 1
			else
				count += 1
			end
		end


		puts "Index: #{index}" #3
		puts "Length: #{p_length}" #$

		#BOING
		count = 0
		while count < 26 
			puts "Index: #{index}" #3
			puts "Count: #{count}!" #0
			puts phrase

						#3   Z   =        25      Z      false      
			if phrase[index].upcase == alphabet[count].upcase 
				alphabet_valid = true
				count = 27
				count += 1
			else
				alphabet_valid = false
				count +=1
			end
		end

		if alphabet_valid == false
			phrase[index] = "boing"
			index = index + 5
			p_length = phrase.length
		end

		puts "2. Index: #{index}"
		puts "2. Length: #{p_length}"

		index += 1
	end
	puts "#{alphabet_valid}"
	return phrase
end


puts "Say something!"
phrase = gets.chomp

result = robotinator(phrase)
print result


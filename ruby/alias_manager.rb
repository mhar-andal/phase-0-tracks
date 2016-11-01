=begin
	
PSUEDOCODE
-Take user input for first and last name
-call method and pass first and last name in parameters
-run a condition to check for uppercase, if uppercase, downcase and set back to uppercase when done
 --user hash to store value of uppercase
-run a condition to check for vowels, if vowel found increment to next vowel. 
-run a condition to check if next consonants is a vowel, if vowel, skip vowel and choose next consonant

	
=end


def nextvowel()

end

def nextconson()

end

#SWAPPING NAME ALGORITHM WITH ITERATIONS
def generateAlias(fullname)
	index = 0
	fname = []
	lname = []
	while index < fullname.length #WHILE LOOP ASSIGNS FIRST NAME
		if fullname[index] == " "
			exitIndex = index
			index = 100 #QUIT LOOP IF SPACE FOUND
		else
			fname[index] = fullname[index]
		end
		index += 1
	end

	exitIndex += 1 #START NEXT POSITION FOR LAST NAME
	index = 0
	while exitIndex < fullname.length
		lname[index] = fullname[exitIndex]
		exitIndex += 1
		index += 1
	end


end

puts "Welcome to the Alias Name Generator!"

quit = false
while quit != true
	puts "Enter First and Last name!('quit' to exit: "
	fullname = gets.chomp
	if fullname.downcase == "quit"
		quit = true
	else
		generateAlias(fullname)
	end
end

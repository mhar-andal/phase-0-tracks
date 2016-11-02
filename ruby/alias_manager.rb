=begin
	
PSUEDOCODE
-Take user input for first and last name
-call method and pass first and last name in parameters
-run a condition to check for uppercase, if uppercase, downcase and set back to uppercase when done
 --user hash to store value of uppercase
-run a condition to check for vowels, if vowel found increment to next vowel. 
-run a condition to check if next consonants is a vowel, if vowel, skip vowel and choose next consonant

	
=end

def nextvowel(char) #RETURN VOWEL IF VOWEL FOUND
	vowel = ['a', 'e', 'i', 'o', 'u']
	index = 0
	while index < vowel.length   
		if char == vowel[index]
			if char == "u"
				char = "a"
			else
				char = vowel[(index + 1)]
				index = 10
			end
		end
		 
		if char.downcase == vowel[index]
			if char == "U"
				char = "A"
			else
				upcaseChar = vowel[(index + 1)]
				char = upcaseChar.upcase
				index = 10
			end
		end


		index += 1
	end

	return char

end

def nextconson(char) #RETURN CONSON IF CONSON FOUND
	conson = ['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'm', 'n', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']
	index = 0
		if char == conson[index]
		end
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
	while exitIndex < fullname.length #WHILE LOOP ASSIGNS LAST NAME
		lname[index] = fullname[exitIndex]
		exitIndex += 1
		index += 1
	end

	index = 0

	while index < fname.length
		fname[index] = nextvowel(fname[index])
		index +=1
		p fname
	end

	index = 0
	while index < lname.length
		lname[index] = nextvowel(lname[index])
		index += 1
		p lname
	end

	return (fname.join('') + " " + lname.join(''))

end

user_db = {
	"alias_name" => []
}

puts "Welcome to the Alias Name Generator!"


quit = false
while quit != true
	puts "Enter First and Last name!('quit' to exit): "
	fullname = gets.chomp
	if fullname.downcase == "quit"
		quit = true
	else
		user_db["alias_name"].push(generateAlias(fullname))
		p user_db
	end
end

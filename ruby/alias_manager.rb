=begin
	
PSUEDOCODE
-Take user input for first and last name
-run method to check for space to see if name is valid
-call method and pass fullname
	- Inside this method, split the first and last name into seperate arrays, then pass those arrays in the nextvowel and nextconson 
-run a condition to check for vowels, if vowel found increment to next vowel. 
	- Inside this method, check for uppercase, if uppercase found, increment to next vowel but uppercased
-run a condition to check for consonants, if consonant found increment to next consonant
	- Inside this method, check for uppercase, if uppercase found, increment to next vowel but uppercased
-store name
-print name
-print hash that returns all users

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
		 
		if char.downcase == vowel[index] #CHECKS FOR UPPERCASE
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
	while index < conson.length
		if char == conson[index]
			if char == 'z'
				char = 'b'
			else
				char = conson[(index + 1)]
				index = 50
			end
		end

		if char.downcase == conson[index] #CHECKS FOR UPPERCASE
			if char == "Z"
				char = "B"
			else
				upcaseChar = conson[index + 1]
				char = upcaseChar.upcase
				index = 50
			end
		end
		index += 1
	end

	return char
end

def checkValidName(fullname) #CHECK IF NAME IS VALID
	valid = false
	index = 0
	while index < fullname.length
		if fullname[index] == " "
			valid = true
		end
		index += 1
	end

	return valid
end

def generateAlias(fullname)#SWAPPING NAME ALGORITHM WITH ITERATIONS
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

	#BOTH WHILE LOOPS RUN NEXTVOWEL AND NEXTCONSON FOR FNAME AND LNAME
	index = 0
	while index < fname.length
		fname[index] = nextvowel(fname[index])
		fname[index] = nextconson(fname[index])
		index +=1
	end

	index = 0
	while index < lname.length
		lname[index] = nextvowel(lname[index])
		lname[index] = nextconson(lname[index]) 
		index += 1
	end

	return (lname.join('') + " " + fname.join('')) #RETURN FULLNAME

end

#INITILZIE ALIAS NAME HASH
user_db = {
	"alias_name" => []
}

#MENU
puts "Welcome to the Alias Name Generator!"
quit = false
index = 0
while quit != true
	puts "------------------------------------------------------------"
	puts "Enter First and Last name!('quit' to exit): "
	fullname = gets.chomp
	if fullname.downcase == "quit"
		quit = true
	elsif checkValidName(fullname) == false
		puts "Please enter valid name!"
		index -= 1
	else
		user_db["alias_name"].push(generateAlias(fullname))
		aliasname = user_db["alias_name"][index]
		p "#{fullname} is also known as #{aliasname}" 
	end
	index += 1
end

user_db.each {|key, array| print "Secret Agents: #{array}"}
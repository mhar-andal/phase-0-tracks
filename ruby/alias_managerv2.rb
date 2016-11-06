=begin
PSUEDOCODE
-Take user input for first and last name
-run method to check for space to see if name is valid(More than one name)
-call method and pass fullname
	- Inside this method, split the first and last name by the space, rotate to switch first name and last name, then join them together with a space
	- Split the full name into seperate letters and run the another method to increment next vowel or consonant
-run a condition to check for u, z, U, or Z. These conditions will bypass the + 1, and just set the letter to the first letter in vowel or conson.
	- Inside this method, also include an upcase checker that checks if the upcase letter is in the vowel or conson. If it is, increment to next vowel or conson but uppercase
-store name into hash. Hash will allow a call for full name and alias name
-print name
-print hash that returns all users
=end

def generateAlias(fullname)
	fullname = fullname.split(' ').rotate.join(' ')
	aliasname = fullname.split('').map{|x| x = nextChar(x)}
	aliasname = aliasname.join('')
end

def checkValidName(fullname) #CHECK IF NAME IS VALID
	valid = fullname.include?(' ')
end

def nextChar(char)
	vowel = 'aeiou'
	conson = 'bcdfghjklmnpqrstvwxyz'

	if char == 'u'
		char = 'a'
	
		elsif char == 'z'
			char = 'b'

		elsif char == 'U'
			char = 'A'

		elsif char == 'Z'
			char = 'B'

		elsif vowel.include?(char)
			x = vowel.index(char)
			char = vowel[x + 1]

		elsif conson.include?(char)
			x = conson.index(char)
			char = conson[x + 1]

		elsif vowel.upcase.include?(char)
			x = vowel.index(char.downcase)
			char = vowel[x + 1].upcase

		elsif conson.upcase.include?(char)
			x = conson.index(char.downcase)
			char = conson[x + 1].upcase
		else
			char
	end
end

user_db = {}

puts 'Welcome to the Alias Name Generator!'


loop do 
	puts '------------------------------------------------------------'
	puts 'Enter First and Last name!("quit" to exit): '
	fullname = gets.chomp

	if fullname == 'quit' 
		break

		elsif checkValidName(fullname) == false
			puts 'Please enter valid name!'

		else
			alias_name = generateAlias(fullname)
			puts "#{fullname} is also known as #{alias_name}"
			user_db[fullname] = alias_name
	end
end

user_db.each {|key, array| 
	puts "#{key}'s alias name is #{array}"
 }
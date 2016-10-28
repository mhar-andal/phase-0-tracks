#Fixed Varibles
current_year = 2016



def age_validator(age, year, current_year)
	real_age = (current_year - year.to_i)
	if real_age == age.to_i
		puts "Age is correct"
		return true
	else		puts "Age is false"
		return false
	end
end


		
#~~~~MAIN PROGRAM~~~~


#-USER INPUT
main = false
while main != true
	puts "What is your name?"
	name = gets.chomp

	puts "How old are you?"
	age = gets.chomp

	puts "What year were you born?"
	year = gets.chomp

	puts "Our company cafeteria serves garlic bread. Should we order some for you?(yes or no)"
	#WHILE LOOP TO CHECK FOR VALID ANSWER
	quit = false
	while quit != true
		response = gets.chomp
		if response == "yes"
			garlic_bread_pref = true
			quit = true
		elsif response == "no"
			garlic_bread_pref = false
			quit = true
		else
			puts "Please enter valid input(yes or no)"
		end
	end

	puts "Would you like to enroll in the company's health insurance?(yes or no)"
	#WHILE LOOP TO CHECK FOR VALID ANSWER
	quit = false
	while quit!= true
		enroll = gets.chomp
		if enroll == "yes"
			health_insur_pref = true
			quit = true
		elsif enroll == "no"
			health_insur_pref = false
			quit = true
		else
			puts "Please enter valid input(yes or no)"
		end
	end

	#CHECK AGE
	age_valid = age_validator(age, year, current_year)

	#VAMPIRE DETECTION LOGIC

	if age_valid == true
		if (garlic_bread_pref || health_insur_pref) == true
			result = "Probably not a vampire"
		end
	elsif age_valid == false
		if (garlic_bread_pref || health_insur_pref) == false
			result = "Probably a vampire"
		elsif (garlic_bread_pref && health_insur_pref) == false
			result = "Almost certainly a vampire"
		end
	end

	#IF STATEMENT TO CHECK IF DRAKE CULA OR TU FANG IS THE NAME, ALSO DOWNCASES TO MAKE SURE EMPLOYEE ISNT TRICKING THE SYSTEM ;)
	if name.downcase == "drake cula" || name.downcase == "tu fang"
		result = "Definetly a vampire"
	end

	puts result

	puts "Run again?"
	choice = gets.chomp
	if choice == "n"
		main = true
	end

end
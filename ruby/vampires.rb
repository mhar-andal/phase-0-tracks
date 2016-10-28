#FIXED Varibles
current_year = 2016
index = 0
employee_num = 1
#AGE VALIDATOR METHOD
def age_validator(age, year, current_year)
real_age = (current_year - year.to_i)
if real_age == age.to_i
return true
else
return false
end
end
#~~~~MAIN PROGRAM~~~~
 #-USER INPUT
puts "How many employees do you want to test for?"
employee_num = gets.chomp.to_i
while index < employee_num
puts "What is your name?"
name = gets.chomp
puts "How old are you?"
age = gets.chomp
puts "What year were you born?"
year = gets.chomp
puts "Our company cafeteria serves garlic bread. Should we order some for you?(yes or no)"#
#WHILE LOOP TO CHECK FOR VALID ANSWER
quit = false
while quit != true
response = gets.chomp
if response.downcase == "yes"
garlic_bread_pref = true
quit = true
elsif response.downcase == "no"
garlic_bread_pref = false
quit = true
else
  puts "Please enter valid input(yes or no)"
end
end
puts "Would you like to enroll in the company's health insurance?(yes or no)"#
#WHILE LOOP TO CHECK FOR VALID ANSWER
quit = false
while quit != true
enroll = gets.chomp
if enroll.downcase == "yes"
health_insur_pref = true
quit = true
elsif enroll.downcase == "no"
health_insur_pref = false
quit = true
else
  puts "Please enter valid input(yes or no)"
end
end
# CHECK AGE
age_valid = age_validator(age, year, current_year)
# VAMPIRE DETECTION LOGIC
if age_valid == true
if garlic_bread_pref == true || health_insur_pref == true# GARLIC OR HEALTH IF AGE IS TRUE
result = "Probably not a vampire"
end
elsif age_valid == false
if garlic_bread_pref == false && health_insur_pref == false# GARLIC AND HEALTH IF AGE IS FALSE
result = "Almost certainly a vampire"
elsif garlic_bread_pref == false || health_insur_pref == false# GARLIC OR HEALTH IF AGE IS FALSE
result = "Probably a vampire"
end
end
# IF STATEMENT TO CHECK IF DRAKE CULA OR TU FANG IS THE NAME, ALSO DOWNCASES TO MAKE SURE EMPLOYEE ISNT TRICKING THE SYSTEM;)
if name.downcase == "drake cula" || name.downcase == "tu fang"
result = "Definetly a vampire"
end
#CHECK FOR ALLERGIES
quit = false
puts "Please list any allergies, type 'done' to end"
while quit != true
allergies = gets.chomp
if allergies.downcase == "sunshine"
result = "Probably a vampire"
elsif allergies.downcase == "done"
quit = true
end
end
puts result
index += 1
puts
end "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
#CODE REVIEW
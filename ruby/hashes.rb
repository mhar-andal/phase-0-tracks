=begin
Pseudocode
  - Prompt questions for user input
  - Store user input using hashes 
  - Print hash back to display 
  - Prompt the user if they need to update
  - -If they need to update, ask for the variable they 
         need to update.
  - Print hash and exit 
=end

client_data = Hash.new(0)

puts "Enter Client's full name: "
name = gets.chomp
puts "Enter Client age: "
age = gets.chomp.to_i
puts "Enter number of children: "
childnum = gets.chomp.to_i
puts "Enter decor theme: "
decor_theme = gets.chomp
puts "Enter phone number: "
phonenum = gets.chomp.to_i
puts "Enter email: "
email = gets.chomp
puts "Client has insurance(yes or no): "
validInput = false
while validInput != true
insur = gets.chomp
if insur.downcase == "yes"
client_data[:insurance] = true
validInput = true
elsif insur.downcase == "no"
client_data[:insurance] = false
validInput = true
else
  puts "Wrong Input, please enter 'yes' or 'no'"
end
end

client_data[:name] = name
client_data[:age] = age
client_data[:childnum] = childnum
client_data[:decor_theme] = decor_theme
client_data[:phonenum] = phonenum
client_data[:email] = email
client_data[:isClient] = true

p client_data

puts "Which data would you like to update? If none type 'none' "
puts "Data Variables: "
puts "name, age, childnum, decor_theme, phonenum, email, insurance"
puts "Enter data type: "
changeVar = gets.chomp
if changeVar.downcase == "none"
elsif changeVar.downcase == "insurance"
validInput = false
puts "Please enter yes or no for insurance"
while validInput != true
insur = gets.chomp
if insur.downcase == "yes"
client_data[:insurance] = true
validInput = true
elsif insur.downcase == "no"
client_data[:insurance] = false
validInput = true
else
  puts "Wrong Input"
end
end
else
  puts "Enter new data: "
data = gets.chomp
client_data[changeVar.to_sym] = data

end

p client_data
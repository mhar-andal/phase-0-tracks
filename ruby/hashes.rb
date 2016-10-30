=begin
Pseudocode
- Prompt questions for user input
- Store user input using hashes
- Print hash back to display
- Prompt the user if they need to update
- - If they need to update, ask for the variable they need to update.
- Print hash and exit
=end

client_data = Hash.new(0)

puts "Enter your full name: "
name = gets.chomp


client_data[:name] = name
p client_data
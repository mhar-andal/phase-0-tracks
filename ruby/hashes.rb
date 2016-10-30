=begin
Pseudocode
- Prompt questions for user input
- Store user input using hashes
- 
=end

client_data = Hash.new(0)

puts "Enter your full name: "
name = gets.chomp

client_data[:name] = name
p client_data
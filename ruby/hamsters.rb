#USER INPUT
puts "Name: "
name = gets.chomp

puts "Volume Level: "
volume = gets.chomp.to_i

puts "Fur Color: "
color = gets.chomp

puts "Good for Adoption?(yes or no): "
adopt = gets.chomp

puts "Age: "
age = gets.chomp.to_i

#Sets age to nil if blank
if age == 0
	age = nil
end


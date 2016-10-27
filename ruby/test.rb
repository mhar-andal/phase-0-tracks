def add(number)
	number = number + 5
	number = add_6(number)
	puts "#{number}"

end

def add_6(number)
	number = number + 6
	return number
end

add(0)
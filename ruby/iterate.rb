def deleteArray(data)
	data.each {|color| 
		if color == "Red"
			puts "Deleting Red"
			data.delete(color)
		end
	}
end

def deleteHash(data)
	puts "Deleting everyone who has less than or equal too 100"
	data.each {|key, array|
		if array <= 100
			data.delete(key)
		end
	}
end

def filterIfArray(data)
	puts "Deleting the color blue"
	data.delete_if {|color| color == 'Blue'}
end

def filterIfHash(data)
   puts "Printing each user that has less than or equal to 1000"
   finalArray = []
   index = 0
   newarray = data.map do |key, array|
       
       if array <= 1000
           if array != nil
               finalArray[index] = "#{key}"
               index += 1
           end
       end
    end
    
    p finalArray
end

def difFilterIfArray(data)
	puts "Printing each color that has more than 5 letters"
	newarray = data.select{|color| color.length > 5 }
	return newarray
end

def difFilterIfHash(data)
	puts "Deleteing everyone who has less than 1500000"
	data.delete_if {|key, array| array < 1500000 }
end
 
def deleteUntilArray(data)
	puts "Not printing until equal to black"
	quit = false
	index = 0
	while quit != true
		if data[index] == "Black"
			quit = true
		else
			index += 1
		end
	end

	while index < data.length
		puts data[index]
		index += 1
	end
end

def deleteUntilHash(data)
	puts "Not printing until equal to Michael Scott"
	quit = false
	index = 0
	while quit != true
		if data.keys[index] == "Michael Scott"
			quit = true
		else
			if index == data.length
				quit = true
			else
				index += 1
			end
		end
	end

	while index < data.length 
		puts data.keys[index]
		index += 1
	end
end


users = {
	"Ashley" => 1000,
	"Mhar" => 67,
	"Rick" => 1000000,
	"Ryan" => 6489764,
	"Michael Scott" => 30000000
}

words = ['Red', 'Blue', 'Green', 'Black', 'Orange']

p words
p users
puts "--------------------------------------------------"
deleteArray(words)
p words
p users
puts "--------------------------------------------------"
deleteHash(users)
p words
p users
puts "--------------------------------------------------"
filterIfArray(words)
p words
p users
puts "--------------------------------------------------"
filterIfHash(users)
p words
p users
puts "--------------------------------------------------"
difFilterIfHash(users)
p words
p users
puts "--------------------------------------------------"
words = difFilterIfArray(words)
p words
p users
puts "--------------------------------------------------"

puts "Resetting array and hash"
words = ['Red', 'Blue', 'Green', 'Black', 'Orange']

p words
p users
puts "--------------------------------------------------"
deleteUntilArray(words)
p words
p users
puts "--------------------------------------------------"
deleteUntilHash(users)
p words
p users

puts "--------------------------------------------------"
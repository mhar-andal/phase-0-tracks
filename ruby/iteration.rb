def delete(data)
	index = 0   
	while index < data.length
		if data.values_at(data.keys[index])[index] == 1000  # FIX!
			data.delete(data.keys[index])
		end
		index += 1
	end

	p data
end

def deletear(data)
	index = 0
	datalength = data.length
	while index < datalength
		p data[index]
		if data[index].include?('a') == true
			data.delete(data[index])
			index -= 1
			datalength = data.length
		end
		index += 1
	end
	p data
end

def printArrayIf(data)
	data.each do |word| 
		if word.downcase.include?('b') || word.downcase.include?('n')
			puts word
		end
	end
end

def printHashIf(data)
	data.each do |key, array|
		if array >= 100000
			puts "#{key} is rich"
		end
	end
end

def printIfNameFound(data)
	index = 0 
	while index < data.length
		if data.keys[index] == "Ashley"
			puts "We found Ashley!"
		end
		index += 1
	end
end

def printIfColorFound(data)
	index = 0
	while index < data.length
		if data[index] == "Blue"
			puts "We found Blue!"
		end
		index += 1
	end
end

def deleteUntilArray(data)
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
	quit = false
	index = 0
	while quit != true
		if data.keys[index] == "Rick"
			quit = true
		else
			puts data.keys[index]
		end
	end
end

users = {
	"Ashley" => 1000,
	"Mhar" => 67,
	"Rick" => 1000000,
	"Ryan" => 6489764
}

words = ['Red', 'Blue', 'Green', 'Black', 'Orange']


#users = delete(users)
deleted_words = deletear(words)
p "The deleted array is: "
p deleted_words
words = ['Red', 'Blue', 'Green', 'Black', 'Orange']
printArrayIf(words)
printHashIf(users)
printIfNameFound(users)
printIfColorFound(words)
deleteUntilArray(words)



























=begin
streetnames = ['Michigan', 'Wabash', 'State', 'Halsted', 'Van Buren']

neighborhoods = {
	"Rodgers Park" => 'North',
	"Lake Michigan" => 'East',
	"Bridgeport" => 'South',
	"Humboldt Park" => 'West'
}

streetnames.each do |street|
	puts street
end

streetnames.map! do |street|
	street.upcase!
	puts street
end

neighborhoods.each do |neighborhood, direction| puts "#{neighborhood} is #{direction}" 	
end

=end
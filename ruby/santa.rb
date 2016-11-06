class Santa
	attr_reader :age, :ethnicity
	attr_accessor :name, :gender

	def initialize(gender, ethnicity, age)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = age
	end

	def speak
		puts "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_cookies(cookie)
		puts "That was a good #{cookie} cookie"
	end

	def celebrate_birthday()
		@age += 1
	end

	def get_mad_at(reindeer)
		@reindeer_ranking.insert((@reindeer_ranking.length - 1), @reindeer_ranking.delete_at(@reindeer_ranking.index("Prancer")))
		@reindeer_ranking.reject {|x| x.empty?}
	end

	def print
		puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	    puts "Santa Instance Attributes"
	    puts "Gender: #{@gender}"
	    puts "Etnicity: #{@ethnicity}"
	    puts "Age: #{@age}"
	    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	end

# Getter Methods
  # def age
  #   @age
  # end
  # def ethnicity
  #   @ethnicity
  # end

# Setter Methods
  # def gender=(gender)
  #   @gender = gender
  # end

end


example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

age = (0..140).to_a

1000.times do
	Santa.new(example_genders.sample, example_ethnicities.sample, age.sample).print
end




=begin
santas = []

genders = ['Male', 'Female', 'Female', 'Male', 'Prefer not to say']
ethnicities = ['African', 'Asian', 'Asian', 'White','Prefer not to say']

genders.length.times do |x|
	santas << Santa.new(genders[x], ethnicities[x])
end

santas[0].get_mad_at("Prancer")
santas[0].gender = "Female"
santas[0].celebrate_birthday
santas[0].age
santas[0].ethnicity 



puts "-----------------PRINTING SANTA----------------------"
p santas[0]
=end

=begin 
nick = Santa.new

nick.speak
nick.eat_milk_cookies("Chocolate Chip")
=end
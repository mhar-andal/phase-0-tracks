class Puppy
   def initialize
		puts "New DOG!"
		@name = "Billy"
   end

    def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(int)
  	int.times { puts "Woof!"}
  end

  def roll_over()
  	puts "*rolls over*"
  end

  def dog_years(human_age)
  	dog_year = 7 * human_age
  	p dog_year
  end

  def name
  	@name
  end
end

class Person
 attr_reader :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
    puts "Hello #{name}, welcome to the system!"
  end

  def birthday
  	age += 1
  end

  def printInfo
  	puts "#{name} is #{age} and is a #{gender}"
  end

end

#DRIVER CODE
people = []
names = ['Mhar', 'Chris', 'Ashley', 'Danny', 'Rick', 'Bob']
gender = ['Male', 'Female']
age = (0..30).to_a

50.times { people << Person.new(names.sample, age.sample, gender.sample) }

people.each {|person| person.printInfo}

corgi = Puppy.new
corgi.fetch("Ball")
corgi.speak(5)
corgi.roll_over
corgi.dog_years(20)
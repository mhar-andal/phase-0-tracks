# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative = require from within the same directory
# links the files and can refer to either within the code.
# useful for referring compartmentalized data.
require_relative 'state_data'

class VirusPredictor
  # initialize state population and population density within class
  def initialize(state_of_origin, population_density, population)
  @state = state_of_origin
  @population = population
  @population_density = population_density
  @predictions = {
      200 => {speed: 0.5, population_density: 0.4},
      150 => {speed: 1, population_density: 0.3},
      100 => {speed: 1.5, population_density: 0.2},
      50 => {speed: 2, population_density: 0.1},
      0 => {speed: 2.5, population_density: 0.05}

  }
  end

  # runs two seperate methods for virus prediction
  def virus_effects
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{@speed_of_spread} months.\n\n"
  end

  private

  # calculates predicated deaths

  def predicted_deaths

  # predicted deaths is solely based on population density
    if @population_density >= 200
      @speed_of_spread = @predictions[200][:speed]
      calculate_deaths(@predictions[200][:population_density])
    elsif @population_density >= 150
      @speed_of_spread = @predictions[150][:speed]
      calculate_deaths(@predictions[150][:population_density])
    elsif @population_density >= 100
      @speed_of_spread = @predictions[100][:speed]
      calculate_deaths(@predictions[100][:population_density])
    elsif @population_density >= 50
      @speed_of_spread = @predictions[50][:speed]
      calculate_deaths(@predictions[50][:population_density])
    else
      @speed_of_spread = @predictions[0][:speed]
      calculate_deaths(@predictions[0][:population_density])
    end

  end

  def calculate_deaths(rate)
    number_of_deaths = (@population * rate).floor
  end

end

#VALUES ARE STATIC WITHIN HASH IN INITIALIZE METHOD
 
 # # calculates speed of spread in months
 #  def speed_of_spread #in months
 #  # We are still perfecting our formula here. The speed is also affected
 #  # by additional factors we haven't added into this functionality.
 #  speed = 0.0

 #  if @population_density >= 200
 #  speed += 0.5
 #  elsif @population_density >= 150
 #  speed += 1
 #  elsif @population_density >= 100
 #  speed += 1.5
 #  elsif @population_density >= 50
 #  speed += 2
 #  else
 #  speed += 2.5
 #  end 

 #  end


# objective: Create a report for all 50 states
# Steps:
  # Iterate through the state_data 
  # every iteration will create a new object instance of the state
  # run the report methods, 
  # print out report
#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
STATE_DATA.each do |state, population_data|
  puts state
  puts population_data
  report = VirusPredictor.new(state, population_data[:population_density], population_data[:population]) 
  report.virus_effects         
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

# #=======================================================================
# # Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
# => These "Hashy Hash's are nested hashes. So, the difference between the two is that one is nested into each other."
# => The state is the Key of that hash, and inside that key, there is a hash containing two keys(population_density and population) and their values.
# What does require_relative do? How is it different from require?
# => require_relative allows you to pull a file in the same directory, require pulls the file starting from your local defined path
# What are some ways to iterate through a hash?
# => .each, .select
# When refactoring virus_effects, what stood out to you about the variables, if anything?
# => It was passing 3 arguments that weren't even being used
# What concept did you most solidify in this challenge?
# => I was able to get the concept of refactoring solidified, and also nested hashes.
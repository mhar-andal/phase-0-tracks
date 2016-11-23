# require 'sqlite3'
# require 'faker'

# bank_db = SQLite3::Database.new("bank_info.db")
# db.results_as_hash = true

# create_table_cmd = <<-SQL
#   CREATE TABLE IF NOT EXISTS kittens(
#     acct_num INT,
#     name VARCHAR(255),
#     password VARCHAR(255),
#     balance DECIMAL,

#   )
# SQL

# bank_db.execute(create_table_cmd)

# def create_kitten(db, name, age)
#   db.execute("INSERT INTO kittens (name, age) VALUES (?, ?)", [name, age])
# end

class BankingAccount

	def initialize(fullname)
		@fullname = fullname
		@password = newpassword
		@balance = 100
		@accountNumber = genAccountNumber
	end

	def genAccountNumber
		accNum = '%010d' % rand(10 ** 10)
	end

	def printInfo
		puts "~~~~~~~~~~~~~~Bank of Ruby~~~~~~~~~~~~~~"
		puts "#{@fullname}"
		puts "Balance: $#{@balance}"
		puts "Account Number: #{@accountNumber}"
	end

	private

	def newpassword
		confirmed = false
		while confirmed == false
			p "Enter Password: "
			password = gets.chomp
			p "Confirm your password: "
			confirm_password = gets.chomp
			password == confirm_password ? confirmed = true :  password_msg
		end
		return password
	end

	def password_msg
		puts
		puts "Passwords do not match!"
		puts
	end


end


#DRIVER CODE
puts "Welcome to the Bank of Ruby!"
loop do 
	puts "---------------------------MENU---------------------------"
	puts "1. Fill out new Banking Application"
	puts "2. Access account with account number"
	puts "3. Access account with full name and password"
	puts "4. Terminate an Account"
	puts "5. Quit"
	choice = gets.chomp.to_i
	case choice 
		when 1
			puts "We are glad you're starting a banking account with us!"
			puts "First, we need your full name!"
			p "Full Name: "
			fullname = gets.chomp
			puts
			account = BankingAccount.new(fullname)
			account.printInfo

		when 2

		when 3

		when 4

		when 5
			break

		else
			puts "Please enter valid input!"
		
	end
	
end
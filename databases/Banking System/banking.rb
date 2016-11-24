require 'sqlite3'
require 'faker'

bank_db = SQLite3::Database.new("bank_info.db")
bank_db.results_as_hash = true

create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS accounts(
    acct_num INT,
    name VARCHAR(255),
    password VARCHAR(255),
    balance DECIMAL
  )
SQL

bank_db.execute(create_table_cmd)

class BankingAccount

	def initialize(args)
		@fullname = args[:fullname]
		@password = args[:password] || newpassword
		@balance = args[:balance] || 100
		@accountNumber = args[:acct_num] || genAccountNumber
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

	def create_account(bank_db)
 		bank_db.execute("INSERT INTO accounts (acct_num, name, password, balance) VALUES (?, ?, ?, ?)", [@accountNumber, @fullname, @password, @balance])
	end

	private

	def newpassword
		confirmed = false
		while confirmed == false
			p "Enter Password: "
			confirm_password = gets.chomp
			p "Confirm your password: "
			confirm_password_valid = gets.chomp
			confirm_password == confirm_password_valid ? confirmed = true :  password_msg
		end
		return confirm_password
	end

	def password_msg
		puts
		puts "Passwords do not match!"
		puts
	end
end

def new_account(bank_db)
	puts "We are glad you're starting a banking account with us!"
	puts "First, we need your full name!"
	p "Full Name: "
	fullname = gets.chomp
	puts
	account = BankingAccount.new({fullname: fullname})
	account.printInfo
	account.create_account(bank_db)
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
			new_account(bank_db)
		when 2
			puts "Enter you"
		when 3

		when 4

		when 5
			break

		else
			puts "Please enter valid input!"
		
	end
	
end
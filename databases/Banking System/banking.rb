require 'sqlite3'
require 'faker'

bank_db = SQLite3::Database.new("bank_info.db")
bank_db.results_as_hash = true

$create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS accounts(
    acct_num INT,
    name VARCHAR(255),
    pin VARCHAR(255),
    balance DECIMAL
  )
SQL

bank_db.execute($create_table_cmd)

class BankingAccount
	attr_reader :fullname, :accountNumber
	attr_accessor :pin, :balance

	def initialize(args)
		@fullname = args[:fullname]
		@pin = args[:pin] || newpin
		@balance = args[:balance] || 100.00
		@accountNumber = args[:acct_num] || genAccountNumber
	end

	def printInfo
		puts "~~~~~~~~~~~~~~Bank of Ruby~~~~~~~~~~~~~~"
		puts "#{@fullname}"
		puts "Balance: $#{sprintf("%.2f", @balance)}"
		puts "Account Number: #{@accountNumber}"
	end

	def create_account(bank_db)
 		bank_db.execute("INSERT INTO accounts (acct_num, name, pin, balance) VALUES (?, ?, ?, ?)", [@accountNumber, @fullname, @pin, @balance])
	end

	def update_account(bank_db)
		bank_db.execute("UPDATE accounts SET acct_num = '#{@accountNumber}', name = '#{@fullname}', pin = '#{@pin}', balance = '#{@balance}' WHERE acct_num = '#{@accountNumber}'")
	end

	def delete_confirm(bank_db)
		puts "Type 'yes i want to delete my account' if you want to delete your banking account: "
		delete_response = gets.chomp
		if delete_response == "yes i want to delete my account"
			delete_account(bank_db)
		else
			puts "Account not deleted, exiting"
		end
	end

	def change_pin
		puts "Please enter your current pin: "
		pin_input = gets.chomp

		if pin_input == @pin
			@pin = newpin
			puts "You have successfully changed your pin!"
		else
			puts "Your pin is incorrect, please try again."
		end
	end

	def check_pin_length(pin)
		if pin.length <= 3 || pin.length >= 5
			puts "Error, invalid pin (Must be 4 digits)"
			return false
		else
			return true
		end
	end

	private

	def delete_account(bank_db)
		bank_db.execute("DELETE FROM accounts WHERE acct_num = #{@accountNumber};")
		puts "Account successfully deleted!"
	end

	def genAccountNumber
		accNum = '%010d' % rand(10 ** 10)
	end

	def newpin
		confirmed = false
		while confirmed == false
			p "Please enter a new pin(Must be 4 digits): "
			confirm_pin = gets.chomp
			if check_pin_length(confirm_pin) == false
				confirmed = false
			else
				p "Confirm your pin: "
				confirm_pin_valid = gets.chomp
				confirm_pin == confirm_pin_valid ? confirmed = true :  pin_msg
			end
		end
		return confirm_pin
	end

	def pin_msg
		puts
		puts "Pins do not match!"
		puts
	end
end

#METHODS OUTSIDE CLASS

def new_account(bank_db)
	puts "We are glad you're starting a banking account with us!"
	puts "First, we need your full name!"
	p "Full Name: "
	fullname = gets.chomp
	puts
	account = BankingAccount.new({fullname: fullname})
	account.printInfo
	account.create_account(bank_db)
	return account
end

def find_by_account_number(bank_db)
	account_found = false
	while account_found == false
		puts "Enter your account number(type 'exit' to exit): "
		account_number = gets.chomp
		if account_number == "exit"
			account_found = true
			return "exit"
		else 
			account_information = bank_db.execute("SELECT * FROM accounts WHERE acct_num = #{account_number.to_i}")
			if account_information.empty? || account_information == nil
				puts "Account not found with number #{account_number}"
			else
				puts "Account Found!"
				account_found = true
				return account_information
			end
		end
	end
end

def find_by_name(bank_db)
	account_found = false
	while account_found == false
		puts "Enter your full name(please be case sensitive)(type 'exit' to exit): "
		full_name = gets.chomp
		if full_name == "exit"
			account_found = true
			return "exit"
		else
			account_information = bank_db.execute("SELECT * FROM accounts WHERE name = '#{full_name}'")
			if account_information.empty? || account_information == nil
				puts "Account not found with number #{full_name}"		
			else
				puts "Account Found!"
				account_found = true
				return account_information	
			end
		end
	end
end

def open_account(account_info, bank_db)
	account = BankingAccount.new({fullname: account_info[0]['name'], pin: account_info[0]['pin'], balance: account_info[0]['balance'], acct_num: account_info[0]['acct_num'] })
	access_account(account, bank_db)
end

def access_account(account, bank_db)
	puts "----------------------------------------------------------"
	puts "Welcome #{account.fullname}!"
	loop do
		puts "~~~~Menu~~~~"
		puts "1. Make a deposit"
		puts "2. Make a withdrawl"
		puts "3. Print Account Information"
		puts "4. Change Pin number"
		puts "5. Close account"
		puts "0. Exit"
		access_choice = gets.chomp.to_i

		case access_choice
			when 1
				puts "How much would you like to deposit?"
				deposit_amt = gets.chomp.to_f
				account.balance += deposit_amt
				puts "You deposited $#{sprintf("%.2f", deposit_amt)}"
				puts "Your new balance is $#{sprintf("%.2f", account.balance)}"
			when 2
				puts "How much would you like to withdraw?"
				withdraw_amt = gets.chomp.to_f
				if withdraw_amt > account.balance
					puts "Insufficient funds, unable to withdraw $#{sprintf("%.2f", withdraw_amt)}" 
				else
					account.balance -= withdraw_amt
					puts "You have withdrawed $#{sprintf("%.2f", withdraw_amt)}"
					puts "Your new balance is $#{sprintf("%.2f", account.balance)}"
				end
			when 3
				account.printInfo
			when 4
				account.change_pin
			when 5
				account.delete_confirm(bank_db)
				account = nil
				break
			when 0
				puts "Logging off"
				break
			else
				puts "Please enter valid input!"
			end
		end
		account == nil ? return : account.update_account(bank_db)
end

def pin_valid(account_info)
	puts "Please enter your pin: "
	valid_pin_check = gets.chomp
	if account_info[0]['pin'] == valid_pin_check
		return true
	else
		puts "Access denied, pin is incorrect"
		return false
	end
end

#DRIVER CODE
puts "Welcome to the Bank of Ruby!"
loop do 
	puts "---------------------------MENU---------------------------"
	puts "1. Fill out new Banking Application"
	puts "2. Access account with account number and pin"
	puts "3. Access account with full name and pin"
	puts "0. Quit"
	choice = gets.chomp.to_i
	case choice 
		when 1
			access_account(new_account(bank_db), bank_db)
		when 2
			account_info = find_by_account_number(bank_db) 
			if account_info == "exit"
				puts "Exiting"
			else
				if pin_valid(account_info) == true
					open_account(account_info, bank_db)
				end
			end
		when 3
			account_info = find_by_name(bank_db)
			if account_info == "exit"
				puts "Exiting"
			else
				if pin_valid(account_info) == true
					open_account(account_info, bank_db)
				end
			end

		when 0
			break
		else
			puts "Please enter valid input!"
	end	
end
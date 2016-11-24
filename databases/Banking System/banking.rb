require 'sqlite3'
require 'faker'

bank_db = SQLite3::Database.new("bank_info.db")
bank_db.results_as_hash = true

$create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS accounts(
    acct_num INT,
    name VARCHAR(255),
    password VARCHAR(255),
    balance DECIMAL
  )
SQL


bank_db.execute($create_table_cmd)

class BankingAccount
	attr_accessor :fullname, :password, :balance, :accountNumber

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

	def update_account(bank_db)
		bank_db.execute("UPDATE accounts SET acct_num = '#{@accountNumber}', name = '#{@fullname}', password = '#{@password}', balance = '#{@balance}' WHERE acct_num = '#{@accountNumber}'")
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

#OUTSIDE CLASS

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

def find_by_account_number(bank_db)
	account_found = false
	while account_found == false
		puts "Enter your account number(type 'exit' to exit:) "
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

def open_account(account_info, bank_db)
	account = BankingAccount.new({fullname: account_info[0]['name'], password: account_info[0]['password'], balance: account_info[0]['balance'], acct_num: account_info[0]['acct_num'] })
	access_account(account)
	account.update_account(bank_db)
end

def access_account(account)
	puts "----------------------------------------------------------"
	puts "Welcome #{account.fullname}!"
	loop do
		puts "~~~~Menu~~~~"
		puts "1. Make a deposit"
		puts "2. Make a withdrawl"
		puts "3. Change password"
		puts "4. Close account"
		puts "5. Exit"
		access_choice = gets.chomp.to_i

		case access_choice
			when 1
				puts "How much would you like to deposit?"
				deposit_amt = gets.chomp.to_i
				account.balance += deposit_amt
				puts "You deposited $#{sprintf("%.2f", deposit_amt)}"
				puts "Your new balance is $#{sprintf("%.2f", account.balance)}"
			when 2
				puts "How much would you like to withdraw?"
				withdraw_amt = gets.chomp.to_i
				if withdraw_amt > account.balance
					puts "Insufficient funds, unable to withdraw $#{sprintf("%.2f", withdraw_amt)}" 
				else
					account.balance -= withdraw_amt
					puts "You have withdrawed $#{sprintf("%.2f", withdraw_amt)}"
					puts "Your new balance is $#{sprintf("%.2f", account.balance)}"
				end
			when 3

			when 4

			when 5
				break
			else
				puts "Please enter valid input!"
			end
	end
end


#DRIVER CODE
puts "Welcome to the Bank of Ruby!"
loop do 
	puts "---------------------------MENU---------------------------"
	puts "1. Fill out new Banking Application"
	puts "2. Access account with account number"
	puts "3. Access account with full name and password"
	puts "4. Quit"
	choice = gets.chomp.to_i
	case choice 
		when 1
			new_account(bank_db)
		when 2
			account_info = find_by_account_number(bank_db) 
			if account_info == "exit"
			else
				open_account(account_info, bank_db)
			end
		when 3

		when 4
			break
		else
			puts "Please enter valid input!"
		
	end
	
end
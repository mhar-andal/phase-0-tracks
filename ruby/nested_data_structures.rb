=begin
	
this nested data structure is going to represent a customer database in an online store.
	
=end

#DECLARE HASH ARRAY
customer = {
	'username' => "",
	'password' => "",
	'shopping-cart' => []
}

 #SETS STRINGS TO EMPTY HASH KEY
 customer['username'] = "mharandal96"
 customer['password'] = "masterrubycoder"
 #ADD BALANCE TO CUSTOMER HASH
 customer['account-balance'] = 55.68

#PRINT HASH ARRAY
 p customer


#OH NO I'VE GONE SHOPPING! - PUSH TO ADD MULTIPLE ITEMS
customer['shopping-cart'].push("Nike Shirt", "Rock Climbing Chalk", "Socks")


#CHECKOUT - SET HASH ARRAY EQUAL TO HASH ARRAY
customer['checkout'] = customer['shopping-cart']

#PRINT HASH ARRAY
 p customer

#NEW BALANCE
customer['checkout-balance'] = 48.36

#SET CHECKOUT
customer['account-balance'] = customer['account-balance'] - customer['checkout-balance']

#CLEAR CHECKOUT AND CART, AND CHECKOUT-BAL
customer['shopping-cart'] = []
customer['checkout'] = []
customer['checkout-balance'] = 0

#OH NO, I'VE BEEN HACKED
customer['password'] = "cant-h4ck-meh-h4ckers"

#PRINT HASH ARRAY
 p customer
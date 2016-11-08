# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Take the string and separate the strings
  # set default quantity 
  # print the list to the console [can you use one of your other methods here?]
# output: [hash]

# Method to add an item to a list
# input: item name and optional quantity [hash]
# steps:feed the item name and quantity into hash
# output: output hash

# Method to remove an item from the list
# input: take the hash and item name
# steps: identify the key we wish to delete. probably use .delete 
# output:new listed hash

# Method to update the quantity of an item
# input: item name, quantity, and hash
# steps: identify the key we wish to update. 
# output: new listed hash

# Method to print a list and make it look pretty
# input:hash
# steps: key : value .each
# output: printed list

grocery_list = {}

def shopping_list(items, list)
  items = items.split(" ")
  items.each{|item| list[item] = 1}
  list
end

def add_to_list(list, item, quantity)
	list[item] = quantity
	list
end

def remove_item(list, item)
	list.delete(item)
	list
end

def update_item(list, item, quantity)
	list[item] = quantity
	list
end

def print_list(list)
	list.each {|key, val| puts "#{key}: #{val}"}
end

grocery_list = shopping_list("carrots apples cereal pizza", grocery_list)
grocery_list = add_to_list(grocery_list, "Lemonade", 2)
grocery_list = add_to_list(grocery_list, "Tomatoes", 3)
grocery_list = add_to_list(grocery_list, "Onions", 1)
grocery_list = add_to_list(grocery_list, "Ice Cream", 4)
grocery_list = remove_item(grocery_list, "Lemonade")
grocery_list = update_item(grocery_list, "Ice Cream", 1)
print_list(grocery_list)
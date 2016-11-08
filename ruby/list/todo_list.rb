class TodoList
	attr_reader
	attr_accessor :todo_list

	def initialize(list)
		@todo_list = list
	end

	def add_item(item)
		todo_list << item
		todo_list
	end

	def delete_item(item)
		todo_list.delete(item)
	end

	def get_item(index)
		todo_list[index]
	end

	def get_items
		todo_list
	end

	
end
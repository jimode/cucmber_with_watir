class ShoppingCartPage
	include PageObject

	NAME_COLUMN = 1
	SUBTOTAL_COLUMN = 3
	LINES_PER_PUPPY = 6
	
	# def initialize(browser)
	# 	@browser = browser	
	# end

	button(:proceed_to_checkout, value: "Complete the Adoption")
	button(:continue_shopping, value: "Adopt Another Puppy")
	table(:cart, index: 0)
	cell(:cart_total, class: "total_cell")

	def name_for_line_item(line_item)
		table_value(line_item, NAME_COLUMN)
	end

	def subtotal_for_line_item(line_item)
		table_value(line_item, SUBTOTAL_COLUMN)
	end

	# def cart_total
	# 	@browser.td(class: 'total_cell').text
	# end

	# def proceed_to_checkout
	# 	@browser.button(value: 'Complete the Adoption').click
	# end

	# def continue_shopping
	# 	@browser.button(value: 'Adopt Another Puppy').click
	# end



	private


 	def table_value(line_item, column)
 		row = (line_item.to_i - 1) * LINES_PER_PUPPY
 		cart_element[row][column].text
 	end

end
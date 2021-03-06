require_relative 'error_panel'

class CheckoutPage
	include PageObject
	include ErrorPanel
	include DataMagic

	# Default data no longer needed since the data_magic gem is being used.
	# DEFAULT_DATA = {
	# 	'name' => Faker::Name.name,
	# 	'address' => Faker::Address.street_address,
	# 	'email' => Faker::Internet.email,
	# 	'pay_type' => 'Credit card'
	# }


	text_field(:name, id: "order_name")
	text_field(:address, id: "order_address")
	text_field(:email, id: "order_email")
	select_list(:pay_type, id: "order_pay_type")
	button(:place_order, value: 'Place Order')

	def checkout(data = {})
		populate_page_with data_for(:checkout_page, data)
		place_order
	end

	# def checkout(data = {})
	# 	populate_page_with DEFAULT_DATA.merge(data)
	# 	place_order
	# end
	
end
require 'rspec'
require 'page-object'
require 'faker'
require 'data_magic'
require 'require_all'
require_rel 'pages'
require 'nokogiri'
require 'builder'

PageObject::PageFactory.routes = {
	:default => [[HomePage, :select_puppy],
				 [DetailsPage, :add_to_cart],
				 [ShoppingCartPage, :proceed_to_checkout],
				 [CheckoutPage, :checkout]],
}

# module Account
# 	def account_number
# 		# return the value to be displayed
# 		'blah'
# 	end
# end

# DataMagic.add_translator(Account)
World(PageObject::PageFactory)

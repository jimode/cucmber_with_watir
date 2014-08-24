
# Given(/^I am on the puppy adoption site$/) do
#   @browser.goto "http://puppies.herokuapp.com"
# end

# When(/^I click the first View Details button$/) do
#   @browser.button(value: 'View Details', index: 0).click
# end

# When(/^I click the Adopt Me button$/) do
#   @browser.button(value: 'Adopt Me!').click
# end

# When(/^I click the complete the Adoption button$/) do
#   @browser.button(value: 'Complete the Adoption').click
# end

# When(/^I enter "(.*?)" in the name field$/) do |name|
#   @browser.text_field(id: 'order_name').set(name)
# end

# When(/^I enter "(.*?)" in the address field$/) do |address|
#   @browser.text_field(id: 'order_address').set(address)
# end

# When(/^I enter "(.*?)" in the email field$/) do |email|
#   @browser.text_field(id: 'order_email').set(email)
# end

# When(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
#   @browser.select_list(id: 'order_pay_type').select(pay_type)
# end

# When(/^I click the Place Order button$/) do
#   @browser.button(value: 'Place Order').click
# end

# Then(/^I should see "(.*?)"$/) do |expected|
#   expect(@browser.text).to include(expected)
#   # (id: 'notice')
# end

# # Scenario: Adopting two puppies
# Given(/^I am on the puppy adoption site$/) do
#   visit(HomePage)
# end

# When(/^I click the first View Details button$/) do
#   on(HomePage).select_puppy_number 1
# end

# When(/^I click the Adopt Me button$/) do
#   on(DetailsPage).add_to_cart
# end

# When(/^I click the Adopt Another Puppy button$/) do
#   on(ShoppingCartPage).continue_shopping
# end

# When(/^I click the second View Details button$/) do
#   on(HomePage).select_puppy_number 2
# end

# When(/^I click the Complete the Adoption button$/) do
#   on(ShoppingCartPage).proceed_to_checkout
# end

# When(/^I enter "(.*?)" in the name field$/) do |name|
#   on(CheckoutPage).name = name
# end

# When(/^I enter "(.*?)" in the address field$/) do |address|
#   on(CheckoutPage).address = address
# end

# When(/^I enter "(.*?)" in the email field$/) do |email|
#   on(CheckoutPage).email = email
# end

# When(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
#   on(CheckoutPage).pay_type = pay_type
# end

# When(/^I click the Place Order button$/) do
#   on(CheckoutPage).place_order
# end

# Then(/^I should see "(.*?)"$/) do |expected|
#   expect(@browser.text).to include(expected)
# end

# Scenario: Verify the shopping cart with one puppy.
Given(/^I am on the puppy adoption site$/) do
  # @browser.goto 'http://puppies.herokuapp.com/'
  visit(HomePage)
end

When(/^I click the first View Details button$/) do
  # @browser.button(value: 'View Details', index: 0).click
  on(HomePage).select_puppy_number(1)
end

When(/^I click the Adopt Me button$/) do
  # @browser.button(value: 'Adopt Me!').click
  # @cart = ShoppingCartPage.new(@browser)
  on(DetailsPage).add_to_cart
end

 # def row_for(line_item)
 #    (line_item.to_i - 1) * 6
 # end

 # def cart_line_item(line_item)
 #   @browser.table(index: 0)[row_for(line_item)]
 # end

Then(/^I should see "(.*?)" as the name for (line item \d+)$/) do |name, line_item|
  # puts line_item.to_i # => 1
  # puts row = (line_item.to_i - 1) * 6 # => 0
  on(ShoppingCartPage).name_for_line_item(line_item).should include name
end

Then(/^I should see "(.*?)" as the subtotal for (line item \d+)$/) do |subtotal, line_item|
  on(ShoppingCartPage).subtotal_for_line_item(line_item).should == subtotal
end

Then(/^I should see "(.*?)" as the cart total$/) do |total|
  on(ShoppingCartPage).cart_total.should == total
end


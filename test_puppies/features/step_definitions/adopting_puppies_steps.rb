
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

# Scenario: Adopting two puppies
Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
end

When(/^I click the first View Details button$/) do
  @browser.button(value: 'View Details', index: 0).click
end

When(/^I click the Adopt Me button$/) do
  @browser.button(value: 'Adopt Me!').click
  @cart = ShoppingCartPage.new(@browser)
end

When(/^I click the Adopt Another Puppy button$/) do
  @cart.continue_shopping
end

When(/^I click the second View Details button$/) do
  @browser.button(value: 'View Details', index: 1).click
end

When(/^I click the Complete the Adoption button$/) do
  @cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

When(/^I enter "(.*?)" in the name field$/) do |name|
  @browser.text_field(id: 'order_name').set(name)
  @checkout.name = name
end

When(/^I enter "(.*?)" in the address field$/) do |address|
  @checkout.address = address
end

When(/^I enter "(.*?)" in the email field$/) do |email|
  @checkout.email = email
end

When(/^I select "(.*?)" from the pay with dropdown$/) do |pay_type|
  @checkout.pay_type = pay_type
end

When(/^I click the Place Order button$/) do
  @checkout.place_order
end

Then(/^I should see "(.*?)"$/) do |expected|
  expect(@browser.text).to include(expected)
end

# Scenario: Verify the shopping cart with one puppy.
# Given(/^I am on the puppy adoption site$/) do
#   @browser.goto 'http://puppies.herokuapp.com/'
# end

# When(/^I click the first View Details button$/) do
#   @browser.button(value: 'View Details', index: 0).click
# end

# When(/^I click the Adopt Me button$/) do
#   @browser.button(value: 'Adopt Me!').click
#   @cart = ShoppingCartPage.new(@browser)
# end

#  def row_for(line_item)
#     (line_item.to_i - 1) * 6
#  end

#  def cart_line_item(line_item)
#    @browser.table(index: 0)[row_for(line_item)]
#  end

# Then(/^I should see "(.*?)" as the name for line item (\d+)$/) do |name, line_item|
#   # puts line_item.to_i # => 1
#   # puts row = (line_item.to_i - 1) * 6 # => 0
#   @cart.name_for_line_item(line_item.to_i).should include name
# end

# Then(/^I should see "(.*?)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
#   @cart.subtotal_for_line_item(line_item.to_i).should == subtotal
# end

# Then(/^I should see "(.*?)" as the cart total$/) do |total|
#   @cart.cart_total.should == total
# end


# Scenario: Creating a new order in the database
# ================================================
Given(/^I know how many orders I have$/) do
  @number_orders = Order.count
end

When(/^I create a new order$/) do
	create(:order)
end

Then(/^I should have (\d+) additional order$/) do |additional_orders|
  Order.count.should == @number_orders + additional_orders.to_i
end


# Scenario: Read an order object from the database
# ================================================
Given(/^I have an order for "(.*?)"$/) do |name|
	create(:order, name: name)
	@original_name = name
end

When(/^I read that order$/) do
  @order = Order.find_by_name(@original_name)
end

Then(/^the order should have the name "(.*?)"$/) do |name|
  @order.name.should == name
end

# Scenario: Updating an order object
# ================================================
When(/^I update the name to "(.*?)"$/) do |name|
  order = Order.find_by_name(@original_name)
  order.name = name
  order.save
end

Then(/^I should have a record for "(.*?)"$/) do |name|
  order = Order.find_by_name(name)
  order.should_not be_nil
end

Then(/^I should not have a record for "(.*?)"$/) do |name|
  order = Order.find_by_name(name)
  order.should be_nil
end

# Scenario: Delete an order object
# ================================================
When(/^I delete that order$/) do
  order = Order.find_by_name(@original_name)
  order.delete
end

# Scenario: Delivered on date should be set when a puppy is processed
# ===================================================================
Then(/^the adoption delivered on date should be set to the current time$/) do
  adoption = Adoption.first
  adoption.delivered_on.should be_on_or_near_the_time Time.now
end





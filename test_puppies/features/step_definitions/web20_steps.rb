Given(/^I am on the google DynaTable Example page$/) do
  visit_page(DynaTablePage)
end

When(/^I select the schedule for (.+)$/) do |day_of_week|
  on_page(DynaTablePage).select_schedule_for day_of_week
end

Then(/^I should see that (.+) has a class at (.+)$/) do |name, schedule|
  on_page(DynaTablePage).class_schedule_for(name).should include schedule
end
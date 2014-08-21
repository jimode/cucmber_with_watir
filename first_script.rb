# require 'selenium-webdriver'

# browser = Selenium::WebDriver.for :firefox
# browser.navigate.to 'http://www.apple.com'

require 'rubygems'
require 'watir-webdriver'
require_relative 'adoption_helper'

include AdoptionHelper

goto_the_puppy_adoption_site
adopt_puppy_number 1
checkout_with('Cheezy', '123 Main St.', 'cheezy@foo.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!'
close_the_broswer
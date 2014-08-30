# ### find the number of sitcoms and dramas
# #=========================================

When /^I open my shows xml$/ do
  file = File.open("shows.xml")
  @xml = Nokogiri::XML(file)
  file.close
end

Then(/^I should see (\d+) sitcoms$/) do |num_sitcoms|
  @xml.xpath('//sitcom').length.should == num_sitcoms.to_i
end

Then(/^I should see (\d+) drama$/) do |num_dramas|
  @xml.xpath('//drama').length.should == num_dramas.to_i
end

# ### find a phone number from a collection
# #=========================================
Given(/^I have a phone book:$/) do |table|
  puts table.hashes
  builder = Builder::XmlMarkup.new
  @xml = builder.contacts do |contacts|
  	table.hashes.each do |row|
  	  contacts.contact do |contact|
  	  	contact.name row['name']
  	  	contact.phone row['phone']
  	  end
  	end
  end
end

When(/^I look up the phone number for "(.*?)"$/) do |name|
  doc = Nokogiri::XML(@xml)
  contacts = doc.xpath('//contact')
  @node = contacts.find { |row| row.content.include? name }
end

Then(/^I should see the phone number "(.*?)"$/) do |phone_number|
  @node.at_xpath('.//phone').content.should == phone_number
end








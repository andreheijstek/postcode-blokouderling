require 'capybara'

Given(/^I live in this postal code area (\d{4}[a-zA-Z]{2})$/) do |postalcode|
  @postalcode = postalcode
end

When(/^I search for my blokouderling at "([^"]*)"$/) do |page|
  base_url = "http://sintjansgemeente.nl/contact"
  visit "#{base_url}/#{page}"
  fill_in('postcode_id', :with => @postalcode)
  click_on('Vind uw blokouderling')
end

Then(/^the "([^"]*)" and "([^"]*)" should be shown$/) do |blokouderling, email|
  expect(page).to have_content "Ouderling: #{blokouderling}, e-mail: #{email}"
end

Then(/^this message should be shown: "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

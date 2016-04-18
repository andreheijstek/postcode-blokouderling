require 'capybara'

Given(/^I live in this postal code area (\d{4}[a-zA-Z]{2})$/) do |postalcode|
  @postalcode = postalcode
end

When(/^I search for my blokouderling$/) do
  visit "http://sintjansgemeente.nl/contact/wijkouderling/"
  click(page.find(:xpath, '//span[contains(., "Contact")]'))
end

Then(/^the "([^"]*)" and "([^"]*)" should be shown$/) do |blokouderling, email|
  pending # Write code here that turns the phrase above into concrete actions
end

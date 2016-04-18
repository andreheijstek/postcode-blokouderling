require 'capybara'

Given(/^I live in this postal code area (\d{4}[a-zA-Z]{2})$/) do |postalcode|
  @postalcode = postalcode
  visit "http://sintjansgemeente.nl/contact/wijkouderling/"
  fill_in('postcode_id', :with => @postalcode)
end

When(/^I search for my blokouderling$/) do
  click_on('Vind uw blokouderling')
end

Then(/^the "([^"]*)" and "([^"]*)" should be shown$/) do |blokouderling, email|
  element = find(:id, 'blokouderling_id')
  expect(page).to have_content "Ouderling: #{blokouderling}, e-mail: #{email}"
end

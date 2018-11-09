require 'capybara'

Stel(/^ik woon in dit postcodegebied (\d{4}[a-zA-Z]{2})$/) do |postalcode|
  @postal_code = postalcode
end

Als(/^ik zoek naar mijn blokouderling op "([^"]*)"$/) do |page|
  base_url = "http://sintjansgemeente.nl/contact"
  visit "#{base_url}/#{page}"
  fill_in('postcode_id', :with => @postal_code)
  click_on('Vind uw blokouderling')
end

Dan(/^moet "([^"]*)" en "([^"]*)" getoond worden$/) do |blokouderling, email|
  expect(page).to have_content "#{blokouderling}, e-mail: #{email}"
end

Dan(/^moet deze melding getoond worden "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

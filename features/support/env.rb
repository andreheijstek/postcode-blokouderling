#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'
require 'capybara'
require 'capybara/poltergeist'
require 'launchy'

Capybara.javascript_driver     = :poltergeist
Capybara.default_driver        = :poltergeist
# Capybara.default_driver        = :selenium
Capybara.run_server            = false
Capybara.default_selector      = :css
Capybara.default_max_wait_time = 10

options = {js_errors: false}
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options)
end
After do |scenario|
  save_and_open_page if scenario.failed?
end

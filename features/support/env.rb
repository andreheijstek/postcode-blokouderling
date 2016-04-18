#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'
require 'capybara'

Capybara.default_driver        = :selenium
Capybara.run_server            = false
Capybara.default_selector      = :css
Capybara.default_max_wait_time = 10

#CAPYBARA
require 'capybara/cucumber'
require 'capybara/session'
require 'capybara'
require 'capybara/poltergeist'

Capybara.javascript_driver     = :poltergeist
Capybara.default_driver        = :poltergeist
Capybara.run_server            = false
Capybara.default_selector      = :css
Capybara.default_max_wait_time = 10

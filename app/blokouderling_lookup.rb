require 'opal'
require 'opal-jquery'

Document.ready? do
  Element.find('#foo').text = "Opal is loaded"
end

puts "Hi from Ruby"

postcode = Element.find('#postcode_id').value.upcase.gsub(/ /, '')
puts postcode
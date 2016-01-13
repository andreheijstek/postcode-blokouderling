require_relative './postcode.rb'

pc1 = Postcode.new('1000AA')
pc2 = Postcode.new('9999ZZ')

puts "1000AA > 9999ZZ? #{pc1 > pc2}"
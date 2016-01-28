require 'opal'
require 'opal-jquery'
# require '../app/postcode'

class Postcode

  include Comparable

  attr_reader :numbers, :letters

  def initialize(postcode)
    @postcode = postcode.upcase.delete(' ')
    @numbers = @postcode[0..3]
    @letters = @postcode[4..5]
  end

  def <=> (other)
    (self.numbers == other.numbers) ? self.letters <=> other.letters : self.numbers <=> other.numbers
  end
end

postcode = Element.find('#postcode_id').value.upcase.gsub(/ /, '')
puts postcode

pc = Postcode.new(postcode)
puts "Postcode 1"
pc2800 = Postcode.new('2800AA')
puts "Postcode 2"
pc2900 = Postcode.new('2900AA')
puts "Postcode 3"

if pc.between?(pc2800, pc2900) then
  puts "In 2800 range"
else
  puts "Outside 2800 range"
end

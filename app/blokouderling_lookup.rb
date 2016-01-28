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

postcode = Postcode.new(Element.find('#postcode_id').value.upcase.gsub(/ /, ''))

blokouderling = case
                  when postcode.between?(Postcode.new('2801AA'), Postcode.new('2801AS'))
                    "Blok B1, ouderling NN"
                  when postcode.between?(Postcode.new('2801AT'), Postcode.new('2801AT'))
                    "Blok B6, ouderling NN"
                  when postcode.between?(Postcode.new('2801AV'), Postcode.new('2801BA'))
                    "Blok B1, ouderling NN"
                  when postcode.between?(Postcode.new('2801BX'), Postcode.new('2801BZ'))
                    "Blok B6, ouderling NN"
                  when postcode.between?(Postcode.new('2801AT'), Postcode.new('2801AT'))
                    "Blok B6, ouderling NN"
                  when postcode.between?(Postcode.new('2801CA'), Postcode.new('2801CH'))
                    "Blok B6, ouderling NN"
                  else
                    "none"
                end
puts blokouderling

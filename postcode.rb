class Postcode

  include Comparable

  attr_reader :numbers, :letters

  def initialize(postcode)
    @postcode = postcode
    @numbers = @postcode[0..3]
    @letters = @postcode[4..5]
  end

  def <=> (other)
    (self.numbers == other.numbers) ? self.letters <=> other.letters : self.numbers <=> other.numbers
  end
end
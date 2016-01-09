class Postcode

  include Comparable

  attr_reader :numbers, :letters

  def initialize(postcode)
    @postcode = postcode
    @numbers = @postcode[0..3]
    @letters = @postcode[4..5]
  end

  def <=> (other)
    if self.numbers != other.numbers
      return self.numbers <=> other.numbers
    else
      return self.letters <=> other.letters
    end
  end
end
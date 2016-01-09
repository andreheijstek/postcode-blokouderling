class Postcode

  include Comparable

  attr_reader :numbers, :letters

  def initialize(postcode)
    @postcode = postcode
    @numbers = @postcode[0..3]
    @letters = @postcode[4..5]
  end

  def <=> (other)
    if self.numbers < other.numbers
      return -1
    elsif self.numbers > other.numbers
      return 1
    elsif self.numbers == other.numbers
      if self.letters < other.letters
        return -1
      elsif self.letters > other.letters
        return 1
      else return 0
      end
    else
      raise 'failure'
    end
  end
end
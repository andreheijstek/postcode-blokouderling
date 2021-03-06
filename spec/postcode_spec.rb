require_relative '../app/postcode.rb'
require_relative 'spec_helper'

describe 'Postcode' do

  before do
    @pc1 = Postcode.new('2805CZ')
    @pc2 = Postcode.new('2806AB')
    @pc3 = Postcode.new('2807ZZ')
  end

  describe 'create clean postcodes' do
    it 'should have no problems with mixed uppercase/lowercase' do
      pc_down = Postcode.new('2805cz')
      pc_up   = Postcode.new('2805CZ')
      expect(pc_down).to eq(pc_up)
    end

    it 'should have no problems with whitespace' do
      pc_white = Postcode.new('2805 cz')
      pc_clean = Postcode.new('2805cz')
      expect(pc_white).to eq(pc_clean)
    end
  end

  describe 'compare postcodes' do
    it 'should show a postcode as greater than if the numbers are greater' do
      expect(@pc2).to be > @pc1
    end

    it 'should show a postcode as smaller than if the numbers are smaller' do
      expect(@pc1).to be < @pc2
    end

    it 'should show a postcode as greater than if numbers are equal and letters are greater' do
      expect(@pc3).to be > @pc1
    end

    it 'should show a postcode as smaller than if numbers are equal and letters are smaller' do
      expect(@pc1).to be < @pc3
    end

    it 'shoud show postcodes as equal iff numbers and letters are equal' do
      expect(@pc1).to eq(@pc1)
    end
  end

  describe 'ranges' do
    it 'should find a postcode that is clearly between others as between?' do
      pc_between = Postcode.new('2805XX')
      expect(pc_between.between?(@pc1, @pc2)).to be true
    end

    it 'should find a postcode that is just one letter apart as between?' do
      pc_adjacent = Postcode.new('2806AC')
      expect(pc_adjacent.between?(@pc2, @pc3)).to be true
      pc_adjacent = Postcode.new('2807ZY')
      expect(pc_adjacent.between?(@pc2, @pc3)).to be true
    end

    it 'should find a postcode that is exactly on the border as between?' do
      expect(@pc1.between?(@pc1, @pc2)).to be true
    end
  end

  describe 'switch' do
    it 'should be able to use ranges of postcodes in a switch statement' do
      first  = Postcode.new('1000AA')
      second = Postcode.new('2000AA')
      third  = Postcode.new('3000AA')
      search = Postcode.new('4000AA')

      result = case
        when third.between?(first, second)
          "block_1"
        when third.between?(second, third)
          "block_2"
        else
          "none"
        end
      expect(result).to eq "block_2"
    end
  end
end

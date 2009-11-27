require 'rubygems'
require 'shoulda'
require '../../formatters/roman_numeral_formatter.rb'

class RomanNumeralFormatterText < Test::Unit::TestCase
  context "Given a RomanNumeralFormatter" do
    setup {
      @formatter = RomanNumeralFormatter.new
    }
    
    should "format decimal number as Roman" do
      resource = [ 
      ['I',      1], ['II',     2], ['III',    3], ['IV',      4],
      ['V',      5], ['VI',     6], ['VII',    7], ['VIII',    8],
      ['IX',     9], ['X',     10], ['XI',    11], ['XII',    12],
      ['XIII',  13], ['XIV',   14], ['XV',    15], ['XVI',    16],
      ['XVII',  17], ['XVIII', 18], ['XIX',   19], ['XX',     20],
      ['XXI',   21], ['XXIII', 23], ['XXIV',  24], ['XXV',    25],
      ['XXIX',  29], ['XXX',   30], ['XXXIV', 34], ['XXXVI',  36],
      ['XXXIX', 39], ['XL',    40], ['L',     50], ['LIV',    54],
      ['LVIII', 58], ['LIX',   59], ['LXXVI', 76], ['LXXXIX', 89],
      ['XC',    90], ['XCIV', 94],  ['XCVIII', 98], ['IC', 99], 
      ]
      resource.each do |expect, input|
        assert_equal(expect, @formatter.format(input))
      end
    end

  end
end

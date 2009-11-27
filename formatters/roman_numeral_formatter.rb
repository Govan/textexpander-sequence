# Lifted from http://www.xpsd.org/cgi-bin/wiki?TestDrivenDevelopmentTutorialRomanNumerals

class RomanNumeralFormatter
  
  Symbols = { 
    1=>'I', 
    5=>'V', 
    10=>'X', 
    50=>'L',
    100=>'C'
  }
  
  def format(num)
    sym = num < 0 ? "-" : ""
    num = num.abs
    
    return 0 if num.zero?
    return sym<<Symbols[num]  if Symbols.has_key?(num)
    [ [100,  1], 
    [100, 10], 
    [ 50, 10], 
    [ 10,  1], 
    [  5,  1], 
    [  1,  0],
    ].each do |cutPoint, subtractor|
      return sym<<format(cutPoint) + format(num - cutPoint)      if num >  cutPoint
      return sym<<format(subtractor) + format(num + subtractor)  if num >= cutPoint - subtractor and num < cutPoint
    end
  end
end
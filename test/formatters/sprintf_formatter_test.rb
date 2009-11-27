require 'rubygems'
require 'shoulda'
require '../../formatters/sprintf_formatter.rb'

class SprintfFormatterTest < Test::Unit::TestCase
  should "format input as sprintf" do
    input = 500
    ["%.2f", "%s", "%d"].each do |str|
      assert_equal sprintf(str, input), SprintfFormatter.new(str).format(input)
    end
  end
end

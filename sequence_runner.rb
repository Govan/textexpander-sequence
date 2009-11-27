require File.join(File.dirname(__FILE__), 'sequence.rb')

sequence = Sequence.new(ARGV[0])
Sequence.restart if ('restart' == ARGV[1])
puts 'previous' == ARGV[0] ? sequence.previous : sequence.next
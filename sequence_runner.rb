require File.join(File.dirname(__FILE__), 'sequence.rb')

sequence = Sequence.new(ARGV[0])
sequence.restart if ('restart' == ARGV[1])
puts 'previous' == ARGV[1] ? sequence.previous : sequence.next
require 'rubygems'
require 'shoulda'
require '../sequence.rb'

class SequenceTest < Test::Unit::TestCase    
  
  context "Given a new sequence (with the default formatter), it " do
    setup { 
      @sequence = Sequence.new
      @sequence.restart
    }
    
    teardown {
      FileUtils.rm(@sequence.file)
    }
  
    should "start at 0" do
      assert_equal "0", @sequence.current
    end

    should "go to 1 at next number" do
      assert_equal "1", @sequence.next
    end
    
    should "go to 2 at the number after next" do
      @sequence.next
      assert_equal "2", @sequence.next
    end
  
    should "go to -1 at previous number" do 
      assert_equal "-1", @sequence.previous    
    end
    
    should "go to -2 at number before previous" do 
      @sequence.previous    
      assert_equal "-2", @sequence.previous    
    end
    
    should "share its sequence with another object, with the same token" do
      @sequence.next
      new_sequence = Sequence.new()
      assert_equal "2", @sequence.next
    end

    should "not share its sequence with another object, with different token" do
      assert_equal "1", @sequence.next
      assert_equal "2", @sequence.next
      new_sequence = Sequence.new("new_sequence")
      new_sequence.restart
      assert_equal "1", new_sequence.next
      assert_equal "3", @sequence.next
    end

    
  end
end
require 'rubygems'
require 'fileutils'
require 'uuid'
require File.join(File.dirname(__FILE__), 'formatters', 'formatter.rb')

class Sequence
  
  SEQUENCE_DIR = File.expand_path(File.join(File.dirname(__FILE__), "./sequences"))
  
  attr_accessor :token
  attr_accessor :formatter
  
  def initialize(token=nil, formatter=Formatter.new)
    self.token = token.nil? ? UUID.new.generate : token
    self.formatter = formatter
    restart unless exists?
  end
  
  def restart
    write(0)
  end
  
  def current
    number = read
    @formatter.format(number)  
  end
  
  def next
    number = read + 1
    write(number)
    @formatter.format(number)
  end
  
  def previous
    number = read - 1
    write(number)
    @formatter.format(number)
  end
  
  def file
    File.join(SEQUENCE_DIR, @token)
  end
  
  private
    def write(i)
      File.open(file, 'w+') { |f| f.puts i.to_i }
    end
  
    def read
      File.open(file, 'r') { |f| f.read.to_i }
    end
    
    def exists?
      File.exists?(file)
    end
end
class SprintfFormatter
  def initialize(sprintf_str)
    @sprintf_str = sprintf_str
  end
  
  def format(i)
    sprintf(@sprintf_str, i)
  end
end
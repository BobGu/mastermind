class Guess
  attr_accessor :input, :minutes, :seconds
  def initialize(input)
    @input = input.split('')
    @timestamp = Time.now
    @seconds = @timestamp.sec
    @minutes = @timestamp.min
  end
end

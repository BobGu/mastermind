class GuessBuilder
  attr_reader :input
  def initialize(input)
    @input = input.downcase.split('')
  end

  def valid?
    valid = true
    valid_letters = 0
    if @input.count != 4
      return !valid
    else
      @input.each do |letter|
        if letter != 'g' && letter != 'y' && letter != 'r' && letter != 'b'
          return !valid
        else
          valid_letters += 1
        end
      end
      if valid_letters == 4
        valid
      end
    end

  end
end

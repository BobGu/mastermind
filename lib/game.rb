# use this class to create new objects
class Game
  attr_reader :guesses, :sequence
  attr_accessor :sg, :code, :sequence
  def initialize
    @guesses  = []
    @won      = false
    @sg       = SequenceGenerator.new
    @code     = @sg.random
    @sequence = @code.secret
    @matcher  = SequenceMatcher.new
  end

  def guess(input)
    guess_builder = GuessBuilder.new(input)
    if !guess_builder.valid?
      false
    else
      # to create a new guess object
      guess = Guess.new(input)
      @guesses.push guess
      guess
    end
  end

  def won?
    guess = @guesses[-1].input
    matches = @matcher.match(@sequence, guess)
    if matches == ['e', 'e', 'e', 'e']
      @won = true
    else
      printer = GuessPrinter.new
      printer = printer.output(matches, guess)
      puts printer
    end

  end

  def guesses_and_time
    minutes = @guesses[-1].minutes - @guesses[0].minutes
    seconds = @guesses[-1].seconds - @guesses[0].seconds
    if minutes < 0
      minutes += 60
    end

    if seconds < 0
      minutes -= 1
      seconds += 60
    end
    "You correctly guessed '#{@sequence.join}' made #{@guesses.length} guesses, and it took you #{minutes} minutes #{seconds} seconds"
  end




end

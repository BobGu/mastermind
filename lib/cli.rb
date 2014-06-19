class CLI
  attr_reader :command, :mastermind
  def initialize(mastermind)
    @command = ''
    @mastermind = mastermind
  end

  def self.run
    mastermind = Game.new
    new(mastermind).start
  end

  def start
      puts "\nWelcome to MASTERMIND"
      run = true
      while run
        puts "\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
        input = gets.downcase.chomp
          if input == 'p'
            run_state = true
            mastermind.sg = SequenceGenerator.new
            mastermind.code = mastermind.sg.random
            mastermind.sequence = mastermind.code.secret
            mastermind.guesses = []
            while run_state
              puts "\nPlease enter a 4 color combonation of (r)ed, (g)reen, (b)lue, or (y)ellow such as 'rgby' or \nenter (q) to quit"
              user_input = gets.chomp
              user_guess = mastermind.guess(user_input)
              if user_input == 'q'
                puts "\n'Do or do not there is no try' - Yoda"
                run_state = false
              elsif user_guess == false
                puts "\nThat is not a valid input!!"
              elsif mastermind.won?
                puts mastermind.guesses_and_time
                puts "\n'All I do is win win win' - T-Pain"
                puts "\n"
                #data about how long and what guesses they guessed
                run_state = false
              end
            end
          elsif input == 'i'
            puts "The object of the game is to guess the exact order of a random sequence of four colors
            (r)ed, (g)reen, (b)lue, and (y)ellow.  Characters can be reused. For instance 'yyyy' is a possibility for
            an answer"
          elsif input == 'q'
            puts "Thanks for playing mastermind!"
            run = false
          else
            puts "That is not a valid input"
          end
      end
  end

end

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'

class GuessTest < Minitest::Test
  def test_a_guess_exists
    guess = Guess.new('rrrr')
    assert_equal guess.input, 'rrrr'
  end

end

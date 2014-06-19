gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_builder'
require './lib/guess'
class GuessBuilderTest < MiniTest::Test
  def test_guess_is_invalid
    gb = GuessBuilder.new('abcd')
    refute gb.valid?
  end

  def test_guess_is_a_valid_input
    gb = GuessBuilder.new('bbbb')
    assert gb.valid?
  end
end

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/guess'
require './lib/sequence_generator'
require './lib/sequence'
require './lib/sequence_matcher'
require './lib/guess_builder'
class GameTest < Minitest::Test
  def test_there_are_no_guesses_when_game_starts
    game = Game.new
    assert game.guesses.empty? #game will store guesses in an array
  end


  def test_guess_is_added_to_guesses_when_valid
    game = Game.new
    guess = game.guess('bbbb')
    assert game.guesses.length, 1
  end

  def test_if_sequence_is_created_when_game_starts
    game = Game.new
    assert game.sequence.length, 4
  end

end


#random notes
# the sequence generator will intialize the class sequence
# the sequence class will initialize the class sequence matcher

gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_matcher'
require './lib/sequence_generator'
require './lib/sequence'
require './lib/guess'

class SequenceMatcherTest < Minitest::Test
  def test_it_exists
    sequence = Sequence.new(['r', 'r', 'r', 'r'])
    sequence = sequence.secret
    guess = Guess.new('rrrr')
    guess = guess.input
    matcher = SequenceMatcher.new
    assert matcher.match(sequence, guess), !nil
  end

  def test_it_returns_one_exact_match
    sequence = Sequence.new(['r', 'g', 'b', 'y'])
    sequence = sequence.secret
    guess = Guess.new('rrrr')
    guess = guess.input
    matcher = SequenceMatcher.new
    assert_equal matcher.match(sequence, guess), ['n', 'n', 'n', 'e']
  end

  def test_it_returns_one_exact_and_one_correct
    sequence = Sequence.new(['r', 'b', 'b', 'y']) # bbry # bggy
    sequence = sequence.secret
    guess = Guess.new('gbyg')
    guess = guess.input
    matcher = SequenceMatcher.new
    assert_equal matcher.match(sequence, guess), ['n', 'n', 'c', 'e']
  end

  def test_it_returns_two_exact_and_one_correct
    sequence = Sequence.new(['g', 'b', 'b', 'r'])
    sequence = sequence.secret
    guess = Guess.new('bybr')
    guess = guess.input
    matcher = SequenceMatcher.new
    assert_equal matcher.match(sequence, guess), ['n', 'c', 'e', 'e']
  end

  def test_it_returns_four_correct
    sequence = Sequence.new(['b', 'b', 'r', 'y'])
    sequence = sequence.secret
    guess = Guess.new('rybb')
    guess = guess.input
    matcher = SequenceMatcher.new
    assert_equal matcher.match(sequence, guess), ['c', 'c', 'c', 'c']
  end

  def test_it_returns_three_exact
    sequence = Sequence.new(['y', 'r', 'r', 'y'])
    sequence = sequence.secret
    guess = Guess.new('yrby')
    guess = guess.input
    matcher = SequenceMatcher.new
    assert_equal matcher.match(sequence, guess), ['n', 'e', 'e', 'e']
  end
end

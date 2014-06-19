gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence_generator'
require './lib/sequence'

class SequenceGeneratorTest < Minitest::Test
  def test_random_sequence_is_right_length
    sequence_generator = SequenceGenerator.new
    random_sequence = sequence_generator.random
    assert random_sequence.secret.count, 4
  end


end

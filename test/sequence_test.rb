gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sequence'

class SequenceTest < Minitest::Test
  def test_we_can_get_the_sequence_attribute_from_sequence
    Sequence.sequence
  end
end

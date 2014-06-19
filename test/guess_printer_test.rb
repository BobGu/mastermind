gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_printer'

class GuessPrinterTest < Minitest::Test
  def test_it_prints_something
    printer = GuessPrinter.new
    guess = ['b', 'b', 'g', 'g']
    matches = ['n', 'n', 'c', 'e']
    printer = printer.output(matches, guess)
    assert printer, !nil
  end

  def test_prints_the_guess
    printer = GuessPrinter.new
    guess = ['b', 'b', 'g', 'g']
    matches = ['n', 'n', 'c', 'e']
    printer = printer.output(matches, guess)
    assert printer, "'bbgg' was your guess"
  end

  def test_prints_the_matches
    printer = GuessPrinter.new
    guess = ['b', 'b', 'g', 'g']
    matches = ['n', 'n', 'c', 'e']
    printer = printer.output(matches, guess)
    assert printer, "'bbgg' has 1 of the correct elements with 1 in the correct position"
  end
end

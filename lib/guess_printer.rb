class GuessPrinter
  def output(matches, guess)
    guess = guess.join('')
    exact_elements = matches.count('e')
    correct_elements = exact_elements + matches.count('c')
    "'#{guess}' has #{correct_elements} of the correct elements with #{exact_elements} in the correct position"
  end
end

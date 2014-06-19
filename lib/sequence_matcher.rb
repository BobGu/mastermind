class SequenceMatcher
  def match(sequence, guess)
    matches = []
    not_correct_matches = 0
    correct_matches = 0
    exact_matches = 0
    sequence_counts = []
    sequence_counts << sequence.count('r')
    sequence_counts << sequence.count('g')
    sequence_counts << sequence.count('b')
    sequence_counts << sequence.count('y')

    counts = []
    counts << guess.count('r')
    counts << guess.count('g')
    counts << guess.count('b')
    counts << guess.count('y')
    i = 0
    sequence_counts.each do |sequence_count|
      if sequence_count > 0
        if counts[i] > 0
          if sequence_count <= counts[i]
            correct_matches += sequence_count
          else
            correct_matches += counts[i]
          end
        end
      end
      i += 1
    end
    j = 0
    sequence.each do |peg|
      if peg == guess[j]
        exact_matches += 1
        correct_matches -= 1
      end
      j += 1
    end
    not_correct_matches = sequence.length - correct_matches - exact_matches
    not_correct_matches.times { matches << 'n' }
    correct_matches.times { matches << 'c' }
    exact_matches.times { matches << 'e' }
    matches
  end
end

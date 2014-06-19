class SequenceGenerator
  def random
    colors = ['r', 'g', 'b', 'y']
    secret = 4.times.map do
      colors.shuffle[0]
    end
  sequence = Sequence.new(secret)
  end
end

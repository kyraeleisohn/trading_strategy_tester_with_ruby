class Array
  def moving_average
    self.inject{ |sum, value| sum + value }.to_f / self.size
  end

  def exponential_moving_average
    index = self.size - 1
    alpha = 2.0 / (self.size + 1)
    n = (1..self.size).to_a.map{|i| (1 - alpha) ** (i - 1) * self[index - i + 1]}.sum
    d = (1..self.size).to_a.map{|i| (1 - alpha) ** (i - 1)}.sum
    n / d
  end
end
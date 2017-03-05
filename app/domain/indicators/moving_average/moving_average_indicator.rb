class MovingAverageIndicator < TimeWindowedIndicator
  def value
    unless @items.filled?
      return nil
    end

    @items.inject{ |sum, value| sum + value }.to_f / @items.size
  end
end
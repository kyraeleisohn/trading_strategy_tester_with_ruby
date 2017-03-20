class MovingAverageIndicator < TimeWindowedIndicator
  def value
    unless @items.filled?
      return nil
    end

    @items.moving_average
  end
end
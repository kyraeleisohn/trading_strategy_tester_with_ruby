class ExponentialMovingAverageIndicator < TimeWindowedIndicator
  def value
    unless @items.filled?
      return nil
    end

    @items.exponential_moving_average
  end
end
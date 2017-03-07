class HighestValueIndicator < TimeWindowedIndicator
  def value
    unless @items.filled?
      return nil
    end

    @items.max
  end
end
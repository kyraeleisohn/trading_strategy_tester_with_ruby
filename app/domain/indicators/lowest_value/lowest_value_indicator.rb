class LowestValueIndicator < TimeWindowedIndicator
  def value
    unless @items.filled?
      return nil
    end

    @items.min
  end
end
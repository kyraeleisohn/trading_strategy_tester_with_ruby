class EfficiencyRatioIndicator < TimeWindowedIndicator
  def value
    unless @items.filled?
      return nil
    end

    (@items.last - @items.first).abs.to_f / @items.inject{ |sum, value| sum.abs + value.abs }.to_f
  end
end
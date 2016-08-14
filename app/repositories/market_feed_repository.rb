class MarketFeedRepository
  def each
    MarketFeedTable.each { |state| yield state }
  end

  def count
    MarketFeedTable.count
  end
end
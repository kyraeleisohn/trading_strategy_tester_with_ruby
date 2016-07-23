class MarketFeedRepository
  def each
    MarketFeedTable.each { |state| yield state }
  end
end
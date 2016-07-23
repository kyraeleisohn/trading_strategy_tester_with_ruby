class MarketFeedMapper < MarketStateMapper
  def initialize(repository)
    @repository = repository
  end

  def each
    @repository.each do |state|
      yield from_table(state)
    end
  end
end
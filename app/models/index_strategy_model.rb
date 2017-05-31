class IndexStrategyModel < Model
  def initialize(strategies)
    @strategies = strategies
  end

  def to_hash
    {
      data: @strategies.collect{|strategy| strategy.to_hash}
    }
  end
end
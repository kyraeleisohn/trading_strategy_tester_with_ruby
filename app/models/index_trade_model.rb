class IndexTradeModel < Model
  def initialize(trades)
    @trades = trades
  end

  def to_hash
    {
      data: @trades.collect{|trade| trade.to_hash}
    }
  end
end
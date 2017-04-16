class TradeSignal
  BUY = 'buy'
  SELL = 'sell'

  def initialize(type, market_state)
    @type = type
    @market_state = market_state
  end

  def self.buy(market_state)
    self.new(BUY, market_state)
  end

  def self.sell(market_state)
    self.new(SELL, market_state)
  end

  def sell?
    @type == SELL
  end

  def buy?
    @type == BUY
  end

  def date_time
    @market_state.date_time
  end
end
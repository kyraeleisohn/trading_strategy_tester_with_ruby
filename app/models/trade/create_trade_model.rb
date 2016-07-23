class CreateTradeModel < TradeModel
  def initialize(mapper, trade_factory)
    super mapper
    @trade_factory = trade_factory
  end
  
  def create(strategy_id, trade_params)
    @mapper.create(get_trade(strategy_id, trade_params))
  end

  private
  def get_trade(strategy_id, trade_params)
    @trade_factory.get(
      strategy_id,
      trade_params[:id],
      trade_params[:type],
      get_state(trade_params[:opening_state]),
      get_state(trade_params[:closing_state])
    )
  end

  def get_state(state_params)
    MarketState.new(
      state_params[:date_time],
      state_params[:ask_price],
      state_params[:bid_price],
      state_params[:ask_volume],
      state_params[:bid_volume]
    )
  end
end
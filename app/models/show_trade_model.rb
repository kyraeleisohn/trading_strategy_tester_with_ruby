class ShowTradeModel < Model
  def initialize(
      id,
      is_buy,
      final_profit,
      opening_date_time,
      closing_date_time,
      opening_price,
      closing_price,
      opening_state,
      closing_state
  )
    @id                = id
    @is_buy            = is_buy
    @final_profit      = final_profit
    @opening_date_time = opening_date_time
    @closing_date_time = closing_date_time
    @opening_price     = opening_price
    @closing_price     = closing_price
    @opening_state     = opening_state
    @closing_state     = closing_state
  end

  def to_hash
    {
        id:                 @id,
        type:               @is_buy ? 'buy' : 'sell',
        profit:             @final_profit,
        opening_date_time:  @opening_date_time,
        closing_date_time:  @closing_date_time,
        opening_price:      @opening_price,
        closing_price:      @closing_price,
        opening_ask_volume: @opening_state.ask_volume,
        closing_ask_volume: @closing_state.ask_volume,
    }
  end
end
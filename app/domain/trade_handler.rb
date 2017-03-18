class TradeHandler
  attr_reader :id, :open_trade_list, :closed_value

  def initialize(id, trade_id_generator, open_trade_list, trade_mapper)
    @id = id
    @trade_id_generator = trade_id_generator
    @open_trade_list = open_trade_list
    @trade_mapper = trade_mapper
    @closed_value = 0
  end

  def open_buy_trade(strategy_id, opening_state)
    new_trade = BuyTrade.new(strategy_id, @trade_id_generator.get, opening_state)
    @open_trade_list << new_trade

    new_trade
  end

  def open_sell_trade(strategy_id, opening_state)
    new_trade = SellTrade.new(strategy_id, @trade_id_generator.get, opening_state)
    @open_trade_list << new_trade

    new_trade
  end

  def close_trade(trade, closing_state)
    @open_trade_list.delete trade
    trade.closing_state = closing_state
    @closed_value += trade.final_profit
    @trade_mapper.store trade
  end

  def current_value(market_state)
    profit = 0
    @open_trade_list.each do |trade|
      profit += trade.profit market_state
    end

    profit + @closed_value
  end
end
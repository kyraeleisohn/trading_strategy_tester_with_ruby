class TradeHandler
  attr_reader :open_trade_list, :closed_trade_list

  def initialize(trade_id_generator, open_trade_list, closed_trade_list, statistic_generator, statistic_mapper, trade_mapper)
    @trade_id_generator = trade_id_generator
    @open_trade_list = open_trade_list
    @closed_trade_list = closed_trade_list
    @statistic_generator = statistic_generator
    @statistic_mapper = statistic_mapper
    @trade_mapper = trade_mapper
  end

  def open_buy_trade(strategy_id, opening_state)
    @open_trade_list << BuyTrade.new(strategy_id, @trade_id_generator.get, opening_state)
  end

  def open_sell_trade(strategy_id, opening_state)
    @open_trade_list << SellTrade.new(strategy_id, @trade_id_generator.get, opening_state)
  end

  def close_trade(trade, closing_state)
    @open_trade_list.delete trade
    trade.closing_state = closing_state
    @closed_trade_list << trade
    @trade_mapper.store trade
    @statistic_mapper.save statistic
  end

  private
  def statistic
    @statistic_generator.get @closed_trade_list
  end
end
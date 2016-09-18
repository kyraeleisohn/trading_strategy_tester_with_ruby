class Trade
  attr_reader :id, :opening_state, :strategy_id
  attr_accessor :closing_state

  def initialize(strategy_id, id, opening_state)
    @strategy_id = strategy_id
    @id = id
    @opening_state = opening_state
  end

  def is_sell
    false
  end

  def is_buy
    false
  end

  def profit(closing_state)
    0
  end

  def final_profit
    profit closing_state
  end
end
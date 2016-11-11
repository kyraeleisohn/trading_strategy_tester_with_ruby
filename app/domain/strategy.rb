
class Strategy
  attr_accessor :id, :name, :parameter_list, :chart

  def initialize(
    id,
    name,
    parameters,
    trade_handler,
    chart
  )
    @id = id
    @name = name
    @parameter_list = parameters
    @trade_handler = trade_handler
    @chart = chart
  end

  def tick(market_state)
    random_factor = @parameter_list[:random_factor]

    if 0 == Random.new.rand(random_factor) then
      @trade_handler.open_buy_trade(@id, market_state)
    end

    open_trades = @trade_handler.open_trade_list
    if 0 == Random.new.rand(random_factor) && !open_trades.empty? then
      @trade_handler.close_trade(open_trades.sample, market_state)
    end

    update_chart market_state
  end

  private

  def update_chart(market_state)
    chart_data = {
      'floating_value' => @trade_handler.current_value(market_state),
      'closed_value' => @trade_handler.closed_value
    }

    @chart.add(market_state.date_time, chart_data)
  end
end
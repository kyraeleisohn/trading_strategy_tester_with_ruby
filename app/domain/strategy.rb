
class Strategy
  attr_accessor :id, :name, :parameter_list, :chart, :trade_handler, :indicator_list

  def initialize(
    id,
    name,
    parameters,
    trade_handler,
    chart,
    indicator_list,
    time_filter
  )
    @id = id
    @name = name
    @parameter_list = parameters
    @trade_handler = trade_handler
    @chart = chart
    @indicator_list = indicator_list
    @time_filter = time_filter
  end

  def enforce(market_state)
    unless @time_filter.changed market_state.date_time
      return
    end

    @indicator_list.enforce market_state
    update_chart market_state

    act market_state
  end

  def get_indicator_chart_id_list
    @indicator_list.collect {|indicator| indicator.get_chart_id}
  end

  protected
  def act(market_state)

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
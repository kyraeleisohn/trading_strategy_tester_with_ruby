class StrategyListBuilder
  def initialize(trade_handler_builder, parameter_list_builder)
    @trade_handler_builder = trade_handler_builder
    @parameter_list_builder = parameter_list_builder
  end

  def get
    strategy_list = Array.new
    @parameter_list_builder.each do |strategy_parameter_list|
      strategy_list.push Strategy.new(@trade_handler_builder.get, strategy_parameter_list)
    end

    strategy_list
  end
end
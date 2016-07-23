class StrategyStatisticsController < ApplicationController
  def index
    model = GetAllStrategyStatisticModel.new(mapper)

    @strategy_result_list = model.get(params[:page].to_i)
  end

  def show
    model = GetStrategyStatisticModel.new(mapper)

    @strategy_result = model.get(params[:strategy_id])
  end

  private
  def mapper
    StrategyStatisticMapper.new(StrategyStatisticRepository.new)
  end
end

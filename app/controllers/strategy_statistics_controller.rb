class StrategyStatisticsController < ApplicationController
  def index
    model = GetAllStrategyStatisticModel.new(mapper)

    @strategy_result_list = model.get(params[:page].to_i)

    respond_to do |format|
      format.json { render json: @strategy_result_list }
      format.html
    end
  end

  def show
    model = GetStrategyStatisticModel.new(mapper)

    @strategy_result = model.get(params[:id])

    respond_to do |format|
      format.json { render json: @strategy_result }
      format.html
    end
  end

  private
  def mapper
    strategy_summary_mapper_builder = StrategySummaryMapperBuilder.new
    strategy_summary_mapper = strategy_summary_mapper_builder.get

    StrategyStatisticMapper.new strategy_summary_mapper
  end
end

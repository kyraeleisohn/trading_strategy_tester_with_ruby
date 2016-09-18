class StrategyChartsController < ApplicationController
  def show
    model = GetChartModel.new mapper

    @chart = model.get(params[:id])

    render json: @chart
  end

  private
  def mapper
    ChartMapper.new(
      ChartRepository.new
    )
  end
end

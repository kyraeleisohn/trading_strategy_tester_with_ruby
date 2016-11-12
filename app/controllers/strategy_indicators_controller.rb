class StrategyIndicatorsController < ApplicationController
  def show
    model = GetIndicatorModel.new mapper

    @one = model.get(params[:id])

    render json: @one
  end

  private
  def mapper
    mapper_builder = IndicatorMapperBuilder.new
    mapper_builder.get
  end
end

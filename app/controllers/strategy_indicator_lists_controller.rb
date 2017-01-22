class StrategyIndicatorListsController < ApplicationController
  def show
    model = GetIndicatorListModel.new mapper

    @one = model.get(params[:id])

    render json: @one
  end

  private
  def mapper
    mapper_builder = IndicatorListMapperBuilder.new
    mapper_builder.get
  end
end

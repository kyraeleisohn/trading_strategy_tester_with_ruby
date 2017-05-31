class StrategyStatisticsController < ApplicationController
  def index
    render json: service.index(params[:page].to_i)
  end

  def show
    render json: service.show(params[:id])
  end

  private
  def service
    StrategyStatisticServiceBuilder.new.get
  end
end

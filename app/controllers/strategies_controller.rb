class StrategiesController < ApplicationController
  def index
    render json: service.index(params[:page].to_i)
  end

  def show
    render json: service.show(params[:id])
  end

  private
  def service
    StrategyServiceBuilder.new.get
  end
end

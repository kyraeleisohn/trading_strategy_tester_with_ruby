class TradesController < ApplicationController
  def index
    render json: service.index(params[:strategy_id], params[:page].to_i)
  end

  def show
    render json: service.show(params[:id])
  end

  private
  def service
    TradeServiceBuilder.new.get
  end
end

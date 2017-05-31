class ExchangeStatusesController < ApplicationController
  def index
    render json: service.index(params[:q])
  end

  private
  def service
    ExchangeStatusServiceBuilder.new.get
  end
end

class ExchangeStatusesController < ApplicationController
  def index
    model = GetAllExchangeStatusModel.new(mapper)

    @exchange_status_list = model.get

    #params[:page].to_i

    render json: @exchange_status_list
  end

  private
  def mapper
    exchange_status_mapper_builder = ExchangeStatusMapperBuilder.new
    exchange_status_mapper_builder.get
  end
end

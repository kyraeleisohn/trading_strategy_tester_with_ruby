class TradesController < ApplicationController
  def index
    model = GetAllTradeModel.new(
      TradeMapper.new(
        TradeRepository.new,
        MarketStateMapper.new,
        TradeFactory.new
      )
    )
    @get_all_trade = model.get(params[:strategy_id], params[:page].to_i)
  end

  def show
    mapper_builder = TradeMapperBuilder.new
    model = GetTradeModel.new(
      mapper_builder.get
    )
    render json: model.get(params[:strategy_id], params[:id])
  end

  private
    def get_trade_params
      params.require(:id)
      params.require(:opening_state)
      params.require(:closing_state)
      params.require(:strategy_id)

      params
    end
end

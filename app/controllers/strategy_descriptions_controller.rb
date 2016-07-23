class StrategyDescriptionsController < ApplicationController
  def index
    model = GetAllStrategyDescriptionModel.new mapper

    @get_all_description = model.get(params[:page].to_i)
  end

  def show
    model = GetStrategyDescriptionModel.new mapper

    @get_description = model.get(params[:id])
  end

  private
  def mapper
    StrategyDescriptionMapper.new(
        StrategyDescriptionRepository.new
    )
  end
end

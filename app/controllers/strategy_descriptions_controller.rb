class StrategyDescriptionsController < ApplicationController
  def index
    model = GetAllStrategyDescriptionModel.new mapper

    @get_all_description = model.get(params[:page].to_i)
    respond_to do |format|
      format.json { render json: @get_all_description }
      format.html
    end
  end

  def show
    model = GetStrategyDescriptionModel.new mapper

    @get_description = model.get(params[:id])

    respond_to do |format|
      format.json { render json: @get_description }
      format.html
    end
  end

  private
  def mapper
    StrategyDescriptionMapper.new(
        StrategyDescriptionRepository.new
    )
  end
end

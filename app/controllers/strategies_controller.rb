class StrategiesController < ApplicationController
  def index
    model = GetAllStrategyModel.new mapper

    @all = model.get(params[:page].to_i)
    respond_to do |format|
      format.json { render json: @all }
      format.html { render json: @all }
    end
  end

  def show
    model = GetStrategyModel.new mapper

    @one = model.get(params[:id])

    respond_to do |format|
      format.json { render json: @one }
      format.html
    end
  end

  private
  def mapper
    mapper_builder = StrategyMapperBuilder.new
    mapper_builder.get
  end
end

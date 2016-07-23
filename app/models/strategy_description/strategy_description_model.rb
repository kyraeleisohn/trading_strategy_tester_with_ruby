class StrategyDescriptionModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_description_as_array(description)
    {
        :name => description.name,
        :parameter_list => description.parameters,
        :trade_list_url => trade_list_url(description.id),
        :description_url => description_url(description.id)
    }
  end

  private
  def trade_list_url(statistic_id)
    Rails.application.routes.url_helpers.strategy_trades_path(
        {
            :strategy_id => statistic_id,
            :page => 1
        }
    )
  end

  def description_url(description_id)
    Rails.application.routes.url_helpers.strategy_description_path(
        {
            :id => description_id,
        }
    )
  end
end
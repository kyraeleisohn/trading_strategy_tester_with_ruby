class ShowStrategyModel < Model
  def initialize(id, name, parameter_list, chart_id, indicator_chart_id_list)
    @id                      = id
    @name                    = name
    @parameter_list          = parameter_list
    @chart_id                = chart_id
    @indicator_chart_id_list = indicator_chart_id_list
  end

  def to_hash
    {
      id:                      @id,
      name:                    @name,
      parameter_list:          @parameter_list,
      chart_id:                @chart_id,
      indicator_chart_id_list: @indicator_chart_id_list
    }
  end
end
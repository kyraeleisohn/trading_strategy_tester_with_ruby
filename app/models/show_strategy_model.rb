class ShowStrategyModel < Model
  def initialize(id, name, parameter_list, chart_id, indicator_list_id)
    @id                = id
    @name              = name
    @parameter_list    = parameter_list
    @chart_id          = chart_id
    @indicator_list_id = indicator_list_id
  end

  def to_hash
    {
        id:                @id,
        name:              @name,
        parameter_list:    @parameter_list,
        chart_id:          @chart_id,
        indicator_list_id: @indicator_list_id
    }
  end
end
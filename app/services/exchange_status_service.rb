class ExchangeStatusService
  def initialize(mapper, search_request_builder, model_mapper)
    @mapper                 = mapper
    @search_request_builder = search_request_builder
    @model_mapper           = model_mapper
  end

  def index(query_string)
    @model_mapper.map_multiple(@mapper.find(@search_request_builder.build(query_string)))
  end
end
class TradeService
  ITEM_PER_PAGE = 5

  def initialize(mapper, model_mapper)
    @mapper       = mapper
    @model_mapper = model_mapper
  end

  def index(strategy_id, page)
    @model_mapper.map_multiple(@mapper.paginate(strategy_id, page, ITEM_PER_PAGE))
  end

  def show(id)
    @model_mapper.map(@mapper.find_by_id(id))
  end
end
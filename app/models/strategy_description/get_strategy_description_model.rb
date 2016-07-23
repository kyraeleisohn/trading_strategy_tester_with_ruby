class GetStrategyDescriptionModel < StrategyDescriptionModel
  def get(id)
    get_description_as_array(@mapper.find_by_id(id))
  end
end
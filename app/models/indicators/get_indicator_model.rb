class GetIndicatorModel < IndicatorModel
  def get(id)
    get_as_array(@mapper.find_by_id(id))
  end
end
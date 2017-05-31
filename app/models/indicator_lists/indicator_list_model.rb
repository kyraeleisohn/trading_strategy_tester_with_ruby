class IndicatorListModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_as_array(domain)
    {
        :id           => domain.id,
        :item_id_list => domain.get_item_id_list,
    }
  end
end
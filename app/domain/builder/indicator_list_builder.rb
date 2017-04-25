class IndicatorListBuilder < DomainBuilder
  def get
    indicator_builder = IndicatorBuilder.new

    indicator_list = IndicatorList.new(generate_id, Array.new)

    indicator_list.push indicator_builder.get

    indicator_list
  end
end
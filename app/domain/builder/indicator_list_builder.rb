class IndicatorListBuilder < DomainBuilder
  def get(tick_count)
    indicator_builder = IndicatorBuilder.new

    indicator_list = IndicatorList.new(generate_id, Array.new)

    indicator_list.push indicator_builder.get(tick_count)

    indicator_list
  end
end
class IndicatorListBuilder < DomainBuilder
  def get(tick_count)
    indicator_builder = IndicatorListBuilder.new

    indicator_list = IndicatorList.new

    indicator_list.push indicator_builder.get(tick_count)

    indicator_list
  end
end
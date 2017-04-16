class ExponentialMovingAverageIndicatorBuilder < DomainBuilder
  def get_12_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA12SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(12, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_26_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA26SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(26, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_100_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA100SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    ExponentialMovingAverageIndicator.new(
      generate_id,
      chart,
      item_list
    )
  end

  def get_224_seconds(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA224SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(224, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_12_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA12MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(12, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_26_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA26MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(26, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_100_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA100MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_224_minutes(tick_count)
    chart_builder = ChartBuilder.new tick_count
    chart = chart_builder.get 'EMA224MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(224, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end
end
class ExponentialMovingAverageIndicatorBuilder < DomainBuilder
  def get_12_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA12SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(12, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_26_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA26SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(26, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_100_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA100SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    ExponentialMovingAverageIndicator.new(
      generate_id,
      chart,
      item_list
    )
  end

  def get_224_seconds
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA224SECONDS'

    time_filter = TimeFilter.new('second', 1)
    item_list = TimeFilteredFixedSizeArray.new(224, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_12_minutes
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA12MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(12, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_26_minutes
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA26MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(26, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_100_minutes
    chart_builder = ChartBuilder.new
    chart = chart_builder.get 'EMA100MINUTES'

    time_filter = TimeFilter.new('minute', 1)
    item_list = TimeFilteredFixedSizeArray.new(100, time_filter)

    ExponentialMovingAverageIndicator.new(
        generate_id,
        chart,
        item_list
    )
  end

  def get_224_minutes
    chart_builder = ChartBuilder.new
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
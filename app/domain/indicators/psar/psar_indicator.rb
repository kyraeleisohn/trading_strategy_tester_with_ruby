class PsarIndicator < Indicator
  def initialize(
    id,
    chart,
    default_acceleration = 0.02,
    acceleration_threshold = 0.19,
    maximum_acceleration = 0.2,
    acceleration_increment = 0.02,
    lowest_value_indicator,
    highest_value_indicator
  )
    super(id, chart)

    @acceleration = default_acceleration
    @default_acceleration = default_acceleration
    @acceleration_threshold = acceleration_threshold
    @maximum_acceleration = maximum_acceleration
    @acceleration_increment = acceleration_increment
    @extreme_point = nil
    @previous = nil
    @sar = nil
    @prices = FixedSizeArray.new(3)
    @lowest_value_indicator = lowest_value_indicator
    @highest_value_indicator = highest_value_indicator
  end

  def enforce(market_state)
    @prices.push market_state
    @lowest_value_indicator.enforce market_state
    @highest_value_indicator.enforce market_state

    if !@prices.filled? || @lowest_value_indicator.value.nil? || @highest_value_indicator.value.nil?
      @previous = market_state.ask_price
      @extreme_point = market_state.ask_price
      return @sar
    end

    if upward_trend_switch?
      upward_trend_switch
    elsif downward_trend_switch?
      downward_trend_switch?
    elsif falling_sar?
      falling_sar
    else
      rising_sar
    end

    @previous = @sar

    @chart.add(
        market_state.date_time,
        {
            'value' => @sar
        }
    )
  end

  def value
    @sar
  end

  private

  def rising_sar
    highest_value = @highest_value_indicator.value

    if @extreme_point < highest_value
      increment_acceleration
      @extreme_point = highest_value
    end

    @sar = calculate_sar

    if @prices[-1].bid_price < @sar
      @sar = @prices[-1].bid_price
    elsif @prices[-2].bid_price < @sar
      @sar = @prices[-2].bid_price
    end

    if @prices[0].bid_price < @sar
      @sar = @prices[0].ask_price
    end
  end

  def falling_sar?
    @prices[0].ask_price < @prices[-1].ask_price
  end

  def falling_sar
    lowest_value = @lowest_value_indicator.value

    if @extreme_point > lowest_value
      increment_acceleration
      @extreme_point = lowest_value
    end

    @sar = calculate_sar

    if @prices[-1].ask_price > @sar
      @sar = @prices[-1].ask_price
    elsif @prices[-2].ask_price > @sar
      @sar = @prices[-2].ask_price
    end

    if @prices[0].ask_price > @sar
      @sar = @prices[0].bid_price
    end
  end

  def downward_trend_switch?
    @prices[-2].ask_price < @prices[-1].ask_price && @prices[-1].ask_price > @prices[0].ask_price
  end

  def downward_trend_switch
    if @extreme_point.nil?
      @sar = @highest_value_indicator.value
    else
      @sar = @extreme_point
    end

    @extreme_point = @lowest_value_indicator.value
    @acceleration = @default_acceleration
  end

  def upward_trend_switch?
    @prices[-2].ask_price > @prices[-1].ask_price && @prices[-1].ask_price < @prices[0].ask_price
  end

  def upward_trend_switch
    if @extreme_point.nil?
      @sar = @lowest_value_indicator.value
    else
      @sar = @extreme_point
    end

    @extreme_point = @highest_value_indicator.value
    @acceleration = @default_acceleration
  end

  def increment_acceleration
    if @acceleration > @acceleration_threshold
      @acceleration = @maximum_acceleration
    else
      @acceleration = @acceleration + @acceleration_increment
    end
  end

  def calculate_sar
    (@extreme_point * @acceleration) + ((1 - @acceleration) * @previous)
  end
end
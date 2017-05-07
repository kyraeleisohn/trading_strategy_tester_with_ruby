class Psar2Indicator < Indicator
  def initialize(
    id,
    chart,
    time_filter,
    default_acceleration = 0.02,
    acceleration_threshold = 0.19,
    maximum_acceleration = 0.2,
    acceleration_increment = 0.02,
    lowest_value_indicator,
    highest_value_indicator
  )
    super(id, chart)

    @time_filter = time_filter
    @acceleration_factor = default_acceleration
    @default_acceleration = default_acceleration
    @acceleration_threshold = acceleration_threshold
    @maximum_acceleration = maximum_acceleration
    @acceleration_increment = acceleration_increment

    @extreme_point = nil

    @lowest_value_indicator = lowest_value_indicator
    @highest_value_indicator = highest_value_indicator

    @prior_highs = FixedSizeArray.new(2)
    @prior_lows = FixedSizeArray.new(2)

    @uptrend = false
    @ready = false
  end

  def enforce(market_state)
    unless @time_filter.changed market_state.date_time
      return
    end

    @lowest_value_indicator.enforce market_state
    @highest_value_indicator.enforce market_state

    unless ready?
      initial_values market_state

      return
    end

    if rising_sar?
      rising_sar
    else
      falling_sar
    end

    if down_trend_switch? market_state
      down_trend_switch market_state
    elsif up_trend_switch? market_state
      up_trend_switch market_state
    end

    @prior_extreme_point = @extreme_point
    @prior_sar = @current_sar
    @prior_acceleration_factor = @acceleration_factor
    @prior_highs.push market_state.ask_price
    @prior_lows.push market_state.bid_price

    @chart.add(
        market_state.date_time,
        {
            'value' => @current_sar
        }
    )
  end

  def value
    @current_sar
  end

  private

  def ready?
    @ready
  end

  def initial_values(market_state)
    @ready = true
    @prior_sar = market_state.ask_price
    @prior_acceleration_factor = @default_acceleration
    @prior_extreme_point = @highest_value_indicator.value
    @prior_highs.push market_state.ask_price
    @prior_lows.push market_state.bid_price
  end

  def down_trend_switch?(market_state)
    rising_sar? && market_state.bid_price < @current_sar
  end

  def up_trend_switch?(market_state)
    !rising_sar? && market_state.ask_price > @current_sar
  end

  def down_trend_switch(market_state)
    @current_sar = @extreme_point
    @extreme_point = market_state.bid_price
    @lowest_value_indicator.reset
    @highest_value_indicator.reset
    @uptrend = false
    @acceleration_factor = @default_acceleration
  end

  def up_trend_switch(market_state)
    @current_sar = @extreme_point
    @extreme_point = market_state.ask_price
    @lowest_value_indicator.reset
    @highest_value_indicator.reset
    @uptrend = true
    @acceleration_factor = @default_acceleration
  end

  def rising_sar?
    @uptrend
  end

  def rising_sar
    new_high = @highest_value_indicator.value
    if @extreme_point.nil? || new_high > @extreme_point
      @extreme_point = new_high
      @acceleration_factor = @acceleration_factor + @acceleration_increment
      @acceleration_factor = [@acceleration_factor, @maximum_acceleration].min
    end

    @current_sar = @prior_sar + (@prior_acceleration_factor * (@prior_extreme_point - @prior_sar))

    if @current_sar > @prior_lows.max
      @current_sar = @prior_lows.min
    end
  end

  def falling_sar
    new_low = @lowest_value_indicator.value
    if @extreme_point.nil? || new_low < @extreme_point
      @extreme_point = new_low
      @acceleration_factor = @acceleration_factor + @acceleration_increment
      @acceleration_factor = [@acceleration_factor, @maximum_acceleration].min
    end

    @current_sar = @prior_sar - (@prior_acceleration_factor * (@prior_sar - @prior_extreme_point))

    if @current_sar < @prior_highs.min
      @current_sar = @prior_highs.max
    end
  end
end
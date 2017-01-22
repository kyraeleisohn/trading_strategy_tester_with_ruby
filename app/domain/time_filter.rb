class TimeFilter
  def initialize(unit_type, unit_count)
    @last = 0
    @size = get_size(unit_type, unit_count)
  end

  def changed(date)
    current = date.to_time.to_i
    if @last + @size < current
      @last = current

      return true
    end

    false
  end

  private
  def get_size(unit_type, unit_count)
    get_unit_type_multiplier(unit_type) * unit_count
  end

  def get_unit_type_multiplier(unit_type)
    case unit_type
      when 'second'
        return 1
      when 'minute'
        return 60
      when 'hour'
        return 60 * 60
      when 'day'
        return 60 * 60 * 24
      when 'week'
        return 60 * 60 * 24 * 7
    end
  end
end
class TimeFilteredFixedSizeArray < FixedSizeArray
  def initialize(unit_count, time_filter)
    super unit_count
    @time_filter = time_filter
  end

  def push(item, date_time)
    if @time_filter.changed date_time
      super item
    end
  end
end
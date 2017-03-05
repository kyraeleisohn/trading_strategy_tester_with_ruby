class FixedSizeArray < Array
  def initialize(unit_count)
    @unit_count = unit_count
  end

  def push(item)
    super item

    if count > @unit_count
      shift
    end
  end

  def filled?
    count >= @unit_count
  end
end
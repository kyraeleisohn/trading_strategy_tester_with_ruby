class ShowExchangeStatusModel < Model
  def initialize(id, cycle_maximum, finished_cycles, status, time_spent)
    @id              = id
    @cycle_maximum   = cycle_maximum
    @finished_cycles = finished_cycles
    @status          = status
    @time_spent      = time_spent
  end

  def to_hash
    {
        id:              @id,
        cycle_maximum:   @cycle_maximum,
        finished_cycles: @finished_cycles,
        status:          @status,
        time_spent:      @time_spent
    }
  end
end
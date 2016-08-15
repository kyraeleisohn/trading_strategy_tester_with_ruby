class ExchangeStatus
  STATUS_CREATED = 'created'
  STATUS_PROCESSING = 'processing'
  STATUS_DONE = 'done'

  attr_accessor :cycle_maximum, :time_spent
  attr_reader :id, :finished_cycles, :status

  def initialize(id, cycle_maximum = 0, finished_cycles = 0, time_spent = 0, status = STATUS_CREATED)
    @id = id
    @cycle_maximum = cycle_maximum
    @finished_cycles = finished_cycles
    @status = status
    @time_spent = time_spent
  end

  def start
    @status = STATUS_PROCESSING
  end

  def finish_cycle
    @finished_cycles += 1
  end

  def finish
    @status = STATUS_DONE
  end
end
class ExchangeStatusSearchRequest
  attr_accessor :only_processing

  def initialize
    @only_processing = false
  end

  def enable_only_processing
    @only_processing = true
  end
end
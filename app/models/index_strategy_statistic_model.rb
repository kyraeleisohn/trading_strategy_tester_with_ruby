class IndexStrategyStatisticModel < Model
  def initialize(statistic_list)
    @statistic_list = statistic_list
  end

  def to_hash
    {
      data: @statistic_list.collect{|statistic| statistic.to_hash}
    }
  end
end
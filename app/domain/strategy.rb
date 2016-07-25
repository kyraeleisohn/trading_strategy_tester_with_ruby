class Strategy
  attr_accessor :statistic, :description

  def initialize(statistic, description)
    @statistic = statistic
    @description = description
  end
end
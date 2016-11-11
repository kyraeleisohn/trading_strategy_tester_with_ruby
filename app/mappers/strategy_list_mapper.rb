class StrategyListMapper < Mapper
  def initialize(strategy_mapper)
    @strategy_mapper = strategy_mapper
  end

  def store(strategy_list)
    strategy_list.each do |strategy|
      @strategy_mapper.store strategy
    end
  end
end
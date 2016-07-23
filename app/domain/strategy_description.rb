class StrategyDescription
  attr_accessor :id, :name, :parameters
  def initialize(id, name, parameters)
    @id = id
    @name = name
    @parameters = parameters
  end
end

class AabStrategyParameterListBuilder < StrategyParameterListBuilder
  def initialize
    @parameter_list_list = generate_parameter_list_list
  end

  def each
    @parameter_list_list.each do |parameter_list|
      parameter_list = {:threshold => parameter_list}
      yield parameter_list
    end
  end

  private
  def generate_parameter_list_list
    [
        0.0005,
        0.0008,
        0.001
    ]
  end
end
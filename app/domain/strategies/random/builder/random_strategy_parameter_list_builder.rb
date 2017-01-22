
class RandomStrategyParameterListBuilder < StrategyParameterListBuilder
  def initialize
    @parameter_list_list = generate_parameter_list_list
  end

  def each
    @parameter_list_list.each do |parameter_list|
      parameter_list = {:random_factor => parameter_list}
      yield parameter_list
    end
  end

  private
  def generate_parameter_list_list
    (99..100)
  end
end
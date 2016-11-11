class ChartMapperBuilder
  def get
    ChartMapper.new(
      ChartRepository.new
    )
  end
end
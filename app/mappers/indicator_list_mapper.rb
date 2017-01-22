class IndicatorListMapper < Mapper
  def initialize(repository, indicator_mapper)
    @repository = repository
    @indicator_mapper = indicator_mapper
  end

  def store(indicator_list)
    @repository.store to_table(indicator_list)

    indicator_list.each do |indicator|
      @indicator_mapper.store indicator
    end
  end

  def find_by_id(id)
    table = @repository.find_by_id(id)

    from_table(table)
  end

  private
  def to_table(domain)
    item_id_list = domain.collect do |indicator|
      indicator.id
    end

    IndicatorListTable.new(
      {
          :id => domain.id,
          :indicator_id_list => item_id_list
      }
    )
  end

  def from_table(table)
    indicator_list = table.indicator_id_list.collect do |item_id|
      @indicator_mapper.find_by_id item_id
    end

    IndicatorList.new(
      table.id,
      indicator_list
    )
  end
end
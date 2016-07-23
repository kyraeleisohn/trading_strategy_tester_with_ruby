class StrategyDescriptionMapper
  def initialize(repository)
    @repository = repository
  end

  def find_by_id(description_id)
    table = @repository.find_by_id(description_id)

    from_table(table)
  end

  def find_all
    table_list = @repository.find_all

    table_list.collect { |table| from_table(table) }
  end

  def paginate(page, limit)
    table_list =  @repository.paginate(page, limit)

    table_list.collect { |table| from_table(table) }
  end

  def count
    @repository.count
  end

  def store(description)
    @repository.create(to_table(description))
  end

  private
  def to_table(description)
    StrategyDescriptionTable.new(
      id: description.id,
      name: description.name,
      parameters: description.parameters
    )
  end

  def from_table(table)
    StrategyDescription.new(
      table.id,
      table.name,
      table.parameters
    )
  end
end
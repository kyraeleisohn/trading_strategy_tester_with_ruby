class Chart
  attr_reader :id, :data, :name

  def initialize(id, time_filter, data, name)
    @id = id
    @count = 0
    @time_filter = time_filter
    @data = data
    @name = name
  end

  def add(datetime, values)
    changed = false
    if @time_filter.changed datetime then
      @data.push(
        {
          'label' => datetime,
          'values' => values
        }
      )

      changed = true
    end

    @count = @count + 1

    changed
  end
end
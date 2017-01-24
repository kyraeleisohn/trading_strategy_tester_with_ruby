class Chart
  attr_reader :id, :data, :mod, :name

  def initialize(id, mod, data, name)
    @id = id
    @count = 0
    @mod = mod
    @data = data
    @name = name
  end

  def add(datetime, values)
    changed = false
    if @count == 0 || @count % @mod == 0 then
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
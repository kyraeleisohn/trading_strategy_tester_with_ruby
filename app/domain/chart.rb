class Chart
  attr_reader :id, :data, :mod

  def initialize(mod, data)
    @count = 0
    @mod = mod
    @data = data
  end

  def add(datetime, value)
    changed = false
    if @count == 0 || @count % @mod == 0 then
      @data.push(
        {
          'datetime' => datetime,
          'value' => value
        }
      )

      changed = true
    end

    @count = @count + 1

    changed
  end

  def assign(id)
    @id = id
  end
end
class Chart
  attr_reader :id, :data, :mod

  def initialize(mod, data)
    @count = 0
    @mod = mod
    @data = data
  end

  def add(datetime, value)
    if @count == 0 || @count % @mod == 0 then
      @data.push(
        {
          'datetime' => datetime,
          'value' => value
        }
      )
    end

    @count = @count + 1
  end

  def assign(id)
    @id = id
  end
end
class ChartModel
  def initialize(mapper)
    @mapper = mapper
  end

  protected
  def get_as_array(chart)
    {
      :id => chart.id,
      :labels => get_as_labels(chart.data),
      :data_sets => get_as_data_sets(chart.data)
    }
  end

  private
  def get_as_data_sets(data)
    data_sets = Hash.new

    if data.empty?
      return data_sets
    end

    data.first['values'].keys.each do |key|
       data_set = data.collect do |item|
        item['values'][key]
       end

       data_sets[key] = data_set
    end

    data_sets
  end

  def get_as_labels(data)
    data.collect do |item|
      item['label']
    end
  end
end
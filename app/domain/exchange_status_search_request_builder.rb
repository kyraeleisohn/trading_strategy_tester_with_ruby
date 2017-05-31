class ExchangeStatusSearchRequestBuilder
  def build(query_string)
    search_request = ExchangeStatusSearchRequest.new

    if query_string
      search_request = add_status_filter(search_request, query_string)
    end

    search_request
  end

  private
  def add_status_filter(search_request, query_string)
    value = get_filter_value(query_string, 'status')

    if value == 'processing'
      search_request.enable_only_processing
    end

    search_request
  end

  def get_filter_value(query_string, haystack)
    filter_list = query_string.split('+')
    filter_list.each do |filter|
      key_value = filter.split(':')
      key = key_value[0]
      value = key_value[1]

      if key == haystack
        return value
      end
    end
  end
end
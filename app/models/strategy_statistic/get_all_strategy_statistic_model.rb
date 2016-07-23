class GetAllStrategyStatisticModel < StrategyStatisticModel
  ITEM_PER_PAGE = 15
  def get(page = 1)
    total = @mapper.count
    last_page = (total / ITEM_PER_PAGE).ceil
    {
      :total         => total,
      :per_page      => ITEM_PER_PAGE,
      :current_page  => page,
      :last_page     => last_page,
      :next_page_url => get_next_page_url(page, total),
      :prev_page_url => get_prev_page_url(page),
      :from          => (page - 1) * total,
      :to            => page * total,
      :pages         => get_pager_url_list(page, last_page),
      :data          => @mapper.paginate(page, ITEM_PER_PAGE).collect {|statistic| get_statistic_as_array statistic}
    }
  end

  private
  def get_pager_url_list(current_page, last_page)
    result = [
      {
        :page_number => "First",
        :url => get_page_url(1)
      }
    ]

    for i in -2..2
      page = current_page + i
      unless page < 1 or page > last_page
        result << {
          :page_number => page,
          :url => get_page_url(page)
        }
      end
    end

    result << {
        :page_number => "Last",
        :url => get_page_url(last_page)
    }

    result
  end

  def get_prev_page_url(current_page)
    page = current_page - 1
    if page < 1
      return '#'
    end

    get_page_url(page)
  end

  def get_next_page_url(current_page, total)
    page = current_page + 1
    if total <= page
      return '#'
    end

    get_page_url(page)
  end

  def get_page_url(page)
    Rails.application.routes.url_helpers.strategy_statistics_path(
      {
          :page => page
      }
    )
  end
end
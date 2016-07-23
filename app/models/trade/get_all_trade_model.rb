class GetAllTradeModel < TradeModel
  ITEM_PER_PAGE = 15
  def get(strategy_id, page = 1)
    total = @mapper.count strategy_id
    last_page = (total / ITEM_PER_PAGE).ceil
    {
      :total         => total,
      :per_page      => ITEM_PER_PAGE,
      :current_page  => page,
      :last_page     => last_page,
      :next_page_url => get_next_page_url(strategy_id, page, total),
      :prev_page_url => get_prev_page_url(strategy_id, page),
      :from          => (page - 1) * total,
      :to            => page * total,
      :pages         => get_pager_url_list(strategy_id, page, last_page),
      :data          => @mapper.paginate(strategy_id, page, ITEM_PER_PAGE).collect {|trade| get_trade_as_array trade}
    }
  end

  private
  def get_pager_url_list(strategy_id, current_page, last_page)
    result = [
      {
        :page_number => "First",
        :url => get_page_url(strategy_id, 1)
      }
    ]

    for i in -2..2
      page = current_page + i
      unless page < 1 or page > last_page
        result << {
          :page_number => page,
          :url => get_page_url(strategy_id, page)
        }
      end
    end

    result << {
        :page_number => "Last",
        :url => get_page_url(strategy_id, last_page)
    }

    result
  end

  def get_prev_page_url(strategy_id, current_page)
    page = current_page - 1
    if page < 1
      return '#'
    end

    get_page_url(strategy_id, page)
  end

  def get_next_page_url(strategy_id, current_page, total)
    page = current_page + 1
    if total <= page
      return '#'
    end

    get_page_url(strategy_id, page)
  end

  def get_page_url(strategy_id, page)
    Rails.application.routes.url_helpers.strategy_trades_path(
      {
          :strategy_id => strategy_id,
          :page => page
      }
    )
  end
end
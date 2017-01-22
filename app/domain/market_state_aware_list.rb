
class MarketStateAwareList < Array
  def enforce(market_state)
    each do |item|
      item.enforce market_state
    end
  end

  def get_item_id_list
    collect do |item|
      item.id
    end
  end
end
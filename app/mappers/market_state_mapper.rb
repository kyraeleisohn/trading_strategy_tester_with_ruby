class MarketStateMapper < Mapper
  def from_table table
    MarketState.new(
      DateTime.parse(table.date_time),
      table.ask_price,
      table.bid_price,
      table.ask_volume,
      table.bid_volume
    )
  end

  def to_table status
    MarketStatusTable.new(
      date_time: status.date_time,
      ask_price: status.ask_price,
      bid_price: status.bid_price,
      ask_volume: status.ask_volume,
      bid_volume: status.bid_volume
    )
  end
end
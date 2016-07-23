class MarketStatusTable
  include Mongoid::Document

  embedded_in :trades, class_name: "TradeTable", inverse_of: :closing_state
  embedded_in :trades, class_name: "TradeTable", inverse_of: :opening_state

  field :date_time, type: String
  field :ask_price, type: Float
  field :bid_price, type: Float
  field :ask_volume, type: Float
  field :bid_volume, type: Float
end
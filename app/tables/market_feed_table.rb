class MarketFeedTable
  include Mongoid::Document

  store_in collection: "audcad", database: "test_database"

  field :date_time, type: String
  field :ask_price, type: Float
  field :bid_price, type: Float
  field :ask_volume, type: Float
  field :bid_volume, type: Float
end
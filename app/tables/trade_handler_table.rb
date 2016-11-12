class TradeHandlerTable
  include Mongoid::Document

  store_in collection: "trade_handler", database: "test_database"

  field :id, type: String
end

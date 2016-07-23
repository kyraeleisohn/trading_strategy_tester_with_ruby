class TradeTable
  include Mongoid::Document

  store_in collection: "trades", database: "test_database"

  field :id, type: String
  field :type, type: String
  embeds_one :opening_state, class_name: "MarketStatusTable", inverse_of: :opening_state
  embeds_one :closing_state, class_name: "MarketStatusTable", inverse_of: :closing_state
end

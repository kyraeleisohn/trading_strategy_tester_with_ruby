class StrategyTable
  include Mongoid::Document

  store_in collection: "strategy", database: "test_database"

  field :id, type: String
  field :name, type: String
  field :parameter_list, type: Hash
  field :chart_id, type: String
  field :trade_handler_id, type: String
  field :indicator_id, type: String
end

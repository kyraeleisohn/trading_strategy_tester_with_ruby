class StrategyDescriptionTable
  include Mongoid::Document

  store_in collection: "strategy_description", database: "test_database"

  field :id, type: String
  field :name, type: String
  field :parameters, type: Hash
end

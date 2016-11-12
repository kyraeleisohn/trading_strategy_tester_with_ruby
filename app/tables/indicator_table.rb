class IndicatorTable
  include Mongoid::Document

  store_in collection: "indicator", database: "test_database"

  field :id, type: String
  field :chart_id, type: String
end

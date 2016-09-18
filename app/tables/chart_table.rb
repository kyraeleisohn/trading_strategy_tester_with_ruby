class ChartTable
  include Mongoid::Document

  store_in collection: "chart", database: "test_database"

  field :id, type: String
  field :mod, type: Integer
  field :data, type: Array
end

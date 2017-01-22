class IndicatorListTable
  include Mongoid::Document

  store_in collection: "indicator_list", database: "test_database"

  field :id, type: String
  field :indicator_id_list, type: Array
end

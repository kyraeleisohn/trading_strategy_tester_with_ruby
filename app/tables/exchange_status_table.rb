class ExchangeStatusTable
  include Mongoid::Document

  store_in collection: "exchange_status", database: "test_database"

  field :id, type: String
  field :cycle_maximum, type: Integer
  field :finished_cycles, type: Integer
  field :status, type: String
  field :time_spent, type: Integer
end

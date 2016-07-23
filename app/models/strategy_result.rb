class StrategyResult

  include Mongoid::Document

  store_in collection: "strategy_statistic", database: "test_database"

  field :profit, type: Float
  field :profitability, type: Float
  field :trade_count, type: Integer
  field :average_loss, type: Float
  field :average_win, type: Float
  field :maximum_loss, type: Float
  field :maximum_win, type: Float
  field :buy_percentage, type: Float
  field :buy_win_count, type: Integer
  field :sell_win_count, type: Integer
  field :average_trade_length, type: Float
  field :one_minute_trade_count, type: Integer
  field :one_minute_trade_profit, type: Float
  field :one_minute_trade_win_percentage, type: Float
end
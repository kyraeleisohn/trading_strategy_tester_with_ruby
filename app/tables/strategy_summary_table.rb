class StrategySummaryTable
  include Mongoid::Document

  store_in collection: "summary", database: "test_database"

  field :id, type: String
  field :strategy_id, type: String
  field :profit, type: Float
  field :trade_count, type: Integer
  field :winning_trades, type: Integer
  field :losing_trades, type: Integer
  field :win_profit, type: Float
  field :loss_profit, type: Float
  field :maximum_loss, type: Float
  field :maximum_win, type: Float
  field :buy_trade_count, type: Integer
  field :sell_trade_count, type: Integer
  field :buy_trade_win_count, type: Integer
  field :sell_trade_win_count, type: Integer
  field :sum_trade_length, type: Float
  field :one_minute_trade_count, type: Integer
  field :one_minute_trade_profit, type: Float
  field :one_minute_trade_wins, type: Float
  field :spread_cost, type: Float
end

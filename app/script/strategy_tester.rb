#!/usr/bin/env ruby

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

exchange_builder = ExchangeBuilder.new
exchange = exchange_builder.get

strategy_list_builder_builder = StrategyListBuilderBuilder.new
strategy_list_builder = strategy_list_builder_builder.get
strategy_list = strategy_list_builder.get

strategy_list.each do |strategy|
  exchange.register strategy
end

exchange.run
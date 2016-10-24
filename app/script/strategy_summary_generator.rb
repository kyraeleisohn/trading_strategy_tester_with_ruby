#!/usr/bin/env ruby

ENV['RAILS_ENV'] = ARGV.first || ENV['RAILS_ENV'] || 'development'
require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

trade_queue_processor_builder = TradeQueueProcessorBuilder.new
trade_queue_processor = trade_queue_processor_builder.get

trade_queue_processor.run
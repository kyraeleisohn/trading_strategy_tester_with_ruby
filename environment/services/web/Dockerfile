FROM ruby:2.2.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /trading_strategy_result_analytics
WORKDIR /trading_strategy_result_analytics
ADD Gemfile /trading_strategy_result_analytics/Gemfile
ADD Gemfile.lock /trading_strategy_result_analytics/Gemfile.lock
RUN bundle install
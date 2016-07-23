# Ansible managed: /Users/kyraelesiohn/RubymineProjects/trading/trading_strategy_result_analytics/railsbox/ansible/roles/puma/templates/puma.rb.j2 modified on 2016-01-20 22:09:10 by kyraelesiohn on pc132.local

# Feel free to experiment with this, 0/16 is a good starting point.
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

# Go with at least 1 per CPU core, a higher amount will usually help for fast
# responses such as reading from a cache.
workers Integer(ENV['WEB_CONCURRENCY'] || 2)

# Listen on a tcp port or unix socket.
bind "unix:///tmp/var/www/trading_strategy_result_analytics/sockets/puma.development.sock"

# Set Port/Rack/Env
rackup "/var/www/trading_strategy_result_analytics/config.ru"
port 3000
environment "development"

# The path where the pid file will be written to.
pidfile "/tmp/var/www/trading_strategy_result_analytics/pids/puma.development.pid"

# Use a shorter timeout instead of the 60s default. If you are handling large
# uploads you may want to increase this.
worker_timeout 30

# The file that gets logged to.
stdout_redirect "/var/www/trading_strategy_result_analytics/log/puma.development.log", "/var/www/trading_strategy_result_analytics/log/puma.development.err.log"

# Preload the application before starting the workers.
preload_app!

# The path to the puma binary without any arguments, it will inherit everything
# from the original process.
restart_command 'bin/puma'

on_worker_boot do
  # Don't bother having the master process hang onto older connections.
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection


end

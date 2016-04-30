root = "/var/www/q-tasks-rails/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stdout_path "#{root}/log/unicorn.log"
stderr_path "#{root}/log/unicorn.err.log"

listen "/tmp/unicorn.qtasks.sock"
worker_processes 1
timeout 30

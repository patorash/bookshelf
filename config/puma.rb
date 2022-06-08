# https://stackoverflow.com/questions/61017325/how-to-configure-puma-for-a-hanami-application
require_relative './environment'
workers ENV.fetch('WEB_CONCURRENCY', 2)

max_threads_count = ENV.fetch("HANAMI_MAX_THREADS", 5)
min_threads_count = ENV.fetch("HANAMI_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

daemonize true

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
preload_app!

rackup DefaultRackup
# Specifies the `port` that Puma will listen on to receive requests; default is 2300.
port ENV.fetch("PORT", 2300)
environment ENV.fetch("HANAMI_ENV", "development")

# Specifies the `pidfile` that Puma will use.
pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

on_worker_boot do
  Hanami.boot
end

# Puma5系から入った機能
# https://github.com/puma/puma/blob/master/5.0-Upgrade.md
wait_for_less_busy_worker 0.005
nakayoshi_fork true

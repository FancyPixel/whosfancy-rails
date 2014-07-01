preload_app!

min_threads = Integer(ENV['PUMA_MIN_THREADS'] || 5)
max_threads = Integer(ENV['PUMA_MAX_THREADS'] || 5)

threads min_threads, max_threads
workers Integer(ENV['PUMA_WORKER_COUNT'] || 3 )

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] || Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = Integer(ENV['DB_REAP_FREQ'] || 10)
    config['pool']              = Integer(ENV['DB_POOL'] || 5)
    ActiveRecord::Base.establish_connection(config)
  end
end

require 'sidekiq-status'

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware
  end

  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end

  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'] || '6379'
  }
end

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end

  config.redis = {
    host: ENV['REDIS_HOST'],
    port: ENV['REDIS_PORT'] || '6379'
  }
end
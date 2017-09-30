require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GetSchwiftyDemo
  class Application < Rails::Application
    config.autoload_paths << config.root.join("app", "cables")
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_job.queue_adapter = :sidekiq
    config.cache_store = :mem_cache_store, ENV.fetch("MEMCACHED_URL", "localhost:11211")
  end
end

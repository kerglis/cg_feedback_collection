require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin      :imagemagick
  secret      "79f768f53a786612577aa4b32db45c2914552e236ac7ab5abc2aeded6c63dcc3"
  url_format  "/media/:job/:name"
  url_host    Rails.configuration.dragonfly_host

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end


# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end

require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "a4258e9c5cf828ec8d3e94c99a25679a110ed4157c93938935bb81f296ff793a"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: ENV['S3_BUCKET'],
              access_key_id: ENV['AWSACCESSKEYID'],
              secret_access_key: ENV['AWSSECRETKEY'],
              url_scheme: 'https',
              url_host: 'choosychooseit.s3.amazonaws.com'
  end

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

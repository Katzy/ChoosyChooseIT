source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rspec-rails', '~> 3.2'

gem 'dragonfly', '~> 1.0.8'
gem 'dragonfly-s3_data_store'
gem 'remotipart', '~> 1.2'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-fileupload-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'
gem 'capybara', '~> 2.4'
gem 'less-rails-semantic_ui'
gem 'autoprefixer-rails'
gem 'therubyracer'
gem 'chartkick', '~> 1.3.2'
gem 'omniauth'
gem 'omniauth-facebook'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'dotenv-rails', :groups => [:development, :test]
# Use Unicorn as the app server
# gem 'unicorn'
gem 'friendly_id', '~> 5.1.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'auto_html', '~> 1.6.4'

group :production do
  gem 'rails_12factor'
  gem 'rack-cache', :require => 'rack/cache'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Useful for generating database entries for testing
  # See: https://github.com/thoughtbot/factory_girl_rails
  gem 'factory_girl_rails', '~> 4.0'

  # Useful for generating dummy data, e.g., fake email addresses
  # See: https://github.com/stympy/faker
  gem 'faker'

  # Useful Rails-specific RSpec matchers
  # See: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers'
end

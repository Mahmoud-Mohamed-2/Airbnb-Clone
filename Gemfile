source "https://rubygems.org"

# Use Rails version 8.0.1
gem "rails", "~> 8.0.1"
# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"
# Puma web server
gem "puma", ">= 5.0"
# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
# Reduces boot times through caching
gem "bootsnap", require: false
# Allow easy deployment as Docker container
gem "kamal", require: false
# Adds HTTP asset caching/compression and X-Sendfile acceleration to Puma
gem "thruster", require: false

# Use Active Storage variants (optional)
# gem "image_processing", "~> 1.2"

# Gem for email handling (using ActionMailer with SMTP, e.g., Gmail)
gem "mail"
gem "letter_opener" # If you want to preview emails in development mode
gem "rack-cors" # Cross-origin resource sharing for API requests

# Devise for authentication and password reset
gem "devise", "~> 4.9"
gem "devise-jwt", "~> 0.8"

# Active Model serializers (optional, for API responses)
gem "active_model_serializers"

# Static analysis for security vulnerabilities
gem "brakeman", require: false
# Ruby styling with Rubocop
gem "rubocop-rails-omakase", require: false
gem "dotenv-rails", groups: [ :development, :test ]
gem "omniauth"
gem "google_sign_in"
gem "rack-attack"

gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
end

# Uncomment if you plan to use background jobs, like Active Job
# gem "sidekiq"

# Uncomment for any additional tools if needed
# gem "figaro", "~> 1.2" # For environment variables management

gem "rubocop", "~> 1.72"

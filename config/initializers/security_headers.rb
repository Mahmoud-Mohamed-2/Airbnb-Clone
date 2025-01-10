# # config/initializers/security_headers.rb
#
# # Ensure Rack::Attack is available
# if defined?(Rack::Attack)
#   Rack::Attack.blocklist('block all IPs') do |req|
#     # Block a request if the IP is in the blocklist
#     # Example: req.ip == '1.2.3.4'
#     false
#   end
#
#   # Example of limiting requests per IP
#   Rack::Attack.throttle('req/ip', limit: 5, period: 1.minute) do |req|
#     req.ip
#   end
# end
#
# # Add Rack::Attack middleware
# Rails.application.config.middleware.insert_before 0, Rack::Attack

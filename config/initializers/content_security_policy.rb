#
# Rails.application.config.content_security_policy do |policy|
#   policy.default_src :self, :https
#   policy.font_src    :self, :https, :data
#   policy.img_src     :self, :https, :data
#   policy.object_src  :none
#   policy.script_src  :self, :https, 'https://www.gstatic.com'  # Google script resources
#   policy.style_src   :self, :https, :unsafe_inline  # Allow inline styles if necessary
#   policy.frame_src   :self, 'https://accounts.google.com'  # Google OAuth iframe
#
#   # Specify URI for violation reports
#   # policy.report_uri "/csp-violation-report-endpoint"
# end
#
# # If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }
#
# # Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)
#
# # Report CSP violations to a specified URI
# # Rails.application.config.content_security_policy_report_only = true
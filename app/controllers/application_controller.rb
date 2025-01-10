class ApplicationController < ActionController::API
  before_action :set_headers

  private

  def set_headers
    response.set_header('Cross-Origin-Opener-Policy', 'same-origin-allow-popups')
    response.set_header('Cross-Origin-Embedder-Policy', 'require-corp')
  end
end

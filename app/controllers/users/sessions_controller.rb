

class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  respond_to :json

  # Require OpenURI for URL opening
  require "open-uri"

  # POST /users/sign_in
  def create
    if params[:google_token].present?
      handle_google_sign_in
    else
      super
    end
  end

  private

  # Response for successful login
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: "Logged in successfully.",
        data: resource.as_json(only: [ :id, :email, :first_name, :last_name, :avatar_url ]) # Include avatar_url from Active Storage
      }, status: :ok
    else
      render json: {
        message: "Login failed. Invalid credentials."
      }, status: :unauthorized
    end
  end

  # Response for logout
  def respond_to_on_destroy
    if current_user
      sign_out(current_user)
      render json: { message: "Logged out successfully" }, status: :ok
    else
      render json: { message: "Couldn't find an active session." }, status: :unauthorized
    end
  end

  # Handle Google Sign-In
  def handle_google_sign_in
    token = params[:google_token]

    # Validate the Google token
    validator = GoogleIDToken::Validator.new
    begin
      payload = validator.check(token, "572508878231-ritv9flo5nbv3rsbr480f7ommvfkl8a3.apps.googleusercontent.com") # Replace with your actual Google client ID

      email = payload["email"]
      first_name = payload["given_name"]
      last_name = payload["family_name"]
      avatar_url = payload["picture"]  # Fetch avatar URL from Google payload

      # Find or create user
      user = User.find_or_initialize_by(email: email)
      if user.new_record?
        user.first_name = first_name
        user.last_name = last_name
        user.password = Devise.friendly_token[0, 20] # Generate a random password

        # Attach avatar image if available from Google
        if avatar_url.present?
          user.avatar.attach(io: URI.open(avatar_url), filename: "#{email}_avatar.jpg", content_type: "image/jpeg")
        end

        unless user.save
          render json: { message: "Error creating user", errors: user.errors.full_messages }, status: :unprocessable_entity
          return
        end
      else
        # Attach avatar if available from Google and not already attached
        if avatar_url.present? && !user.avatar.attached?
          user.avatar.attach(io: URI.open(avatar_url), filename: "#{email}_avatar.jpg", content_type: "image/jpeg")
        end
      end

      sign_in(user)

      render json: { message: "Logged in successfully with Google.", data: user.as_json(only: [ :id, :email, :first_name, :last_name, :avatar_url ]) }, status: :ok
    rescue GoogleIDToken::ValidationError => e
      render json: { message: "Invalid Google token: #{e.message}" }, status: :unauthorized
    end
  end
end

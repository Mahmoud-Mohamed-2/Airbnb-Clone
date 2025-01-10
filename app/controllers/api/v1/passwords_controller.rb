
class Api::V1::PasswordsController < ApplicationController
  # Request a password reset
  # http://localhost:3000/api/v1/passwords
  def create
    @user = User.find_by(email: params.dig(:user, :email))
    if @user.present?
      @user.send_reset_password_instructions
      render json: { message: "Password reset instructions sent to your email." }, status: :ok
    else
      render json: { error: "Email not found" }, status: :not_found
    end
  end

  # Reset password using token
  # http://localhost:3000/api/v1/passwords/update
  def update
    @user = User.reset_password_by_token(reset_password_params)
    if @user.errors.empty?
      render json: { message: "Password has been reset successfully." }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reset_password_params
    params.require(:user).permit(:reset_password_token, :password, :password_confirmation)
  end
end

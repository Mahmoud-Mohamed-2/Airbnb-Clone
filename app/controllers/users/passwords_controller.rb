# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  def create
    # Log parameters for debugging
    @user = User.find_by(email: params.dig(:user, :email))
    if @user.present?
      @user.send_reset_password_instructions
      render json: { message: "Password reset instructions sent to your email." }, status: :ok
    else
      render json: { error: "Email not found" }, status: :not_found
    end
  end


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

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
  confirmations: "users/confirmations",
  omniauth_callbacks: "users/omniauth_callbacks"
    # We don't need confirmations here, since it's handled in api/v1
  }
  # post 'google_sign_in/callback', to: 'users/omniauth_callbacks#google_oauth2'
  namespace :api do
    namespace :v1 do
      # Route for requesting a password reset (POST)
      # resources :passwords, only: [:create, :update]

      # Get the current logged-in user
      get "current_user", to: "users#get_current_user"
      # Referring to Api::V1::ConfirmationsController
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

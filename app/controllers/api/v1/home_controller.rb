module Api
  module V1
    class HomeController < ApplicationController
      def index
        if current_user
          render json: { first_name: current_user.first_name, last_name: current_user.last_name }
        else
          render json: { message: "User not found" }, status: :not_found
        end
      end
    end
  end
end

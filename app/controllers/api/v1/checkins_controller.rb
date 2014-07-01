module Api
  module V1
    class CheckinsController < ApplicationController

      before_filter :check_auth

      def checkin
        checkin = Checkin.new(user: current_user, direction: :in)
        if checkin.save
          head :no_content
        else
          render json: {errors: checkin.errors}, status: :unprocessable_entity
        end
      end
      
      def checkout
        checkout = Checkin.new(user: current_user, direction: :out)
        if checkout.save
          head :no_content
        else
          render json: {errors: checkin.errors}, status: :unprocessable_entity
        end
      end

      private

      def check_auth
        authenticate_or_request_with_http_basic do |username,password|
          resource = User.find_by_email(username)
          if resource.valid_password?(password)
            sign_in :user, resource
          end
        end
      end

    end
  end
end

class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  # include Knock::Authenticable
  before_action :set_default_format
  before_action :authenticate_user
  # before_action :set_default_format

  private

    def set_default_format
      request.format = :json
    end

    def authenticate_token!
      payload = JsonWebToken.decode(auth_token)
      @current_user = User.find(payload["sub"])

    rescue JWT::ExpireSignature
      render json: {errors: ["Auth token has expired"]}, status: :unauthorized
    rescue JWT::DecodeError
      render json: {errors: ["Invalid auto token"]}, status: :unauthorized
      end
    end

    def auth_token
      @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end
end
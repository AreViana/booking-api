class ApplicationController < ActionController::API
  include ExceptionHandler
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

    private

    def authenticate
      authenticate_or_request_with_http_token do |token, _options|
        user = User.find_by(token: token)
        raise ActionController::BadRequest.new('Invalid token') unless user

        # To prevent timing attacks
        ActiveSupport::SecurityUtils.secure_compare(token, user.token)
        user
      end
    end

    def current_user
      @current_user ||= authenticate
    end
end

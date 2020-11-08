class ApplicationController < ActionController::API
  include ExceptionHandler
  include Pundit
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  before_action :authorize_request!
  after_action :wrap_response

  def params_data
    params.require(:data)
  end

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

  def wrap_response
    body = response.body
    return unless body.present?

    data = JSON.parse(body)
    response.body = { data: data }.to_json
  end

  def current_user
    @current_user ||= authenticate
  end
end

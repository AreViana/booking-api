class Api::AuthenticationController < ApplicationController
  skip_before_action :authenticate, except: :sign_out

  def sign_up
    Authentication::SignUp.call(signup_params.to_h.deep_symbolize_keys)
  end

  def sign_in
    response = Authentication::SignIn.call(login_params.to_h.deep_symbolize_keys)
    render json: response
  end

  def sign_out
    Authentication::SignOut.call(logout_params.to_h.deep_symbolize_keys)
  end

  private

  def signup_params
    params_data.permit(:name, :email, :password, :password_confirmation)
  end

  def login_params
    params_data.permit(:email, :password)
  end

  def logout_params
    params_data.permit(:token)
  end
end

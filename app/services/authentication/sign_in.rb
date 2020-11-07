# frozen_string_literal: true

class Authentication::SignIn < BaseService
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    user = User.find_by(email: email).try(:authenticate, password)
    raise ActionController::BadRequest.new('Invalid credentials') if !user

    token = User.generate_unique_secure_token
    user.update_attribute(:token, token)

    { access_token: user.token }
  end

  private

  attr_reader :email, :password
end

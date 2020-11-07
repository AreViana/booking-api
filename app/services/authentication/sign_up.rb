# frozen_string_literal: true

class Authentication::SignUp < BaseService
  def initialize(name:, email:, password:, password_confirmation:)
    @name = name
    @email = email
    @password = password
    @password_confirmation = password_confirmation
  end

  def call
    raise ActionController::BadRequest.new('Passwords mismatch') if password != password_confirmation

    user = User.find_by(email: email)

    raise ActionController::BadRequest.new('You have already registered') if user

    User.create!(name: name, email: email, password: password, role: 'user')
  end

  private

  attr_reader :name, :email, :password, :password_confirmation
end

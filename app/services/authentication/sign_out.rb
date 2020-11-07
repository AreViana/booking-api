# frozen_string_literal: true

class Authentication::SignOut < BaseService
  def initialize(token:)
    @token = token
  end

  def call
    user = User.find_by(token: token)
    raise ActiveRecord::RecordNotFound.new('Token not found') unless user

    user.update_attribute(:token, nil)
  end

  private

  attr_reader :token
end

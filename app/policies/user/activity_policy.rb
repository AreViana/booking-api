class User::ActivityPolicy < ApplicationPolicy
  def index?
    user.user?
  end

  def book?
    user.user?
  end
end

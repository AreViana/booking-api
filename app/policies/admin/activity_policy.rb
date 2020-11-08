class Admin::ActivityPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def schedule?
    user.admin?
  end
end

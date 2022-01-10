class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.service_owner? || user.admin?
  end

  def create?
    user.service_owner? || user.admin?
  end

  def edit?
    user.service_owner? || user.admin?
  end

  def update?
    user.service_owner? || user.admin?
  end

  def destroy?
    user.service_owner? || user.admin?
  end
end

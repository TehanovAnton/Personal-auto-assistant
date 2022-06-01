# frozen_string_literal: true

class ConsumablePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end

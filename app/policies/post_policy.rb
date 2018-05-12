class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    if record.rider.user == user
      return true
    else
      return false
    end
  end

  def update?
    record.rider.user == user
  end

  def destroy?
    record.rider.user == user
  end

  def like?
    return true
  end

end

class RiderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index
    return true
  end

  def edit?
    record.user == user ? true : false
  end

  def update?
    record.user == user
  end

end

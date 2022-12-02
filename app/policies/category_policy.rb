class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin? || user.has_role?(:moderador)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    user&.admin? || user&.has_role?(:moderador)
  end

  def create?
    user&.admin? || user&.has_role?(:moderador)
  end

  def update?
    user&.admin? || user&.has_role?(:moderador)
  end

  def destroy?
    user&.admin?
  end
end

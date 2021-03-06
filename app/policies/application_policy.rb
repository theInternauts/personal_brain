class ApplicationPolicy
  attr_reader :user, :record, :params

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    user.present?
  end

  def show?
    is_owner? && scope.where(:id => record.id).exists?
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    is_owner?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def is_owner?
    @user === @record.owner
  end

  def search?
    index?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

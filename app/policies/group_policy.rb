class GroupPolicy
  attr_reader :user, :group

  def initialize(user, group)
    @user = user
    @group = group
  end

  def new?
    user.admin? || user.manage?
  end

  def show?
    user.admin? || user.manage? || group.user?(user.id)
  end

  def create?
    user.admin? || user.manage?
  end

  def edit?
    user.admin? || user.manage?
  end

  def update?
    user.admin? || user.manage?
  end

  def destroy?
    user.admin? || user.manage?
  end
  
end
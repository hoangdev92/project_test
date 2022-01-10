class UserPolicy
  attr_reader :user

  def initialize(user, user_record)
    @user = user
    @user_record = user_record
  end

  def edit?
    user.editable? || user.id == user_record.id
  end

  def update?
    user.editable? || user.id == user_record.id
  end

  def destroy?
    user.editable? || user.id == user_record.id
  end
end

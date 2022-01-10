class Department < ApplicationRecord
  has_many :groups, class_name: Group.to_s
  with_options through: :groups do
    has_many :users, source: :users
    has_many :projects, source: :projects
  end
  has_one :manager, class_name: User.to_s, foreign_key: 'manage'

  def user?(user_id)
    users.where(id: user_id).present?
  end

  def manage?(user_id)
    manage == user_id
  end
end

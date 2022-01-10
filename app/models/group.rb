class Group < ApplicationRecord
  belongs_to :department
  has_many :projects
  has_many :user_groups, class_name: UserGroup.to_s
  has_many :users, through: :user_groups, source: :user
end

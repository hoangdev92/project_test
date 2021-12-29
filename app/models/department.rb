class Department < ApplicationRecord
  has_many :groups, class_name: Group.to_s
  with_options through: :groups do
    has_many :users, source: :users
    has_many :projects, source: :projects
  end
end

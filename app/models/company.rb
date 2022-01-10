class Company < ApplicationRecord
  has_many :departments
  with_options through: :departments do
    has_many :users, source: :users
    has_many :groups, source: :groups
    has_many :projects, source: :projects
  end
end

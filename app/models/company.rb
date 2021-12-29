class Company < ApplicationRecord
  has_many :dapartments
  with_options through: :dapartments do
    has_many :users, source: :users
    has_many :groups, source: :groups
    has_many :projects, source: :projects
  end
end

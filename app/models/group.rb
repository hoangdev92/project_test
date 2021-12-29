class Group < ApplicationRecord
  belongs_to :dependent
  has_many :projects
  has_many :users
end

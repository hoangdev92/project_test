class Company < ApplicationRecord
  has_many :dapartments
  has_many :users, through: :dapartments, source: :users
end

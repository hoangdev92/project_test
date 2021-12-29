class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_info, class_name: UserInfo.to_s, dependent: :destroy
  has_one :user_profile, class_name: UserProfile.to_s, dependent: :destroy
  has_many :assignments, class_name: Assignment.to_s, dependent: :destroy
  has_many :projects, through: :assignments, source: :project

  before_create :set_step
  accepts_nested_attributes_for :user_info, :user_profile, allow_destroy: true

  private

  def set_step
    self.step = 0
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :user_info, class_name: UserInfo.to_s, dependent: :destroy
  has_one :user_profile, class_name: UserProfile.to_s, dependent: :destroy
  has_many :assignments, class_name: Assignment.to_s, dependent: :destroy
  has_many :projects, through: :assignments, source: :project
  has_many :user_permissions, class_name: UserPermission.to_s, dependent: :destroy
  has_many :permissions, through: :user_permissions, source: :permission
  has_many :user_groups, class_name: UserGroup.to_s, dependent: :destroy
  has_many :groups, through: :user_groups, source: :group
  has_many :departments, through: :groups, source: :department

  before_create :set_step
  after_create :create_permission
  accepts_nested_attributes_for :user_info, :user_profile, allow_destroy: true

  %w[admin manage hr learder staff].each_with_index do |plan_name, i|
    define_method("#{plan_name}?") do
      permissions.where(id: (i + 1)).present?
    end
  end

  def editable?
    admin? || manage? || hr?
  end

  private

  def set_step
    self.step = 0
  end

  def create_permission
    user_permissions.create(permission_id: STAFFID)
  end
end

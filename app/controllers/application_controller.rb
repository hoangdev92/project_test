class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :check_user_active, if: :not_register_and_login
  helper_method :current_company

  def not_register_and_login
    %w[users/registrations users/session].exclude?(params[:controller])
  end

  def check_user_active
    return if current_user.blank?

    redirect_to edit_user_registration_path if current_user.step.blank? || current_user.step.zero?
  end

  def current_company
    Company.first
  end
end

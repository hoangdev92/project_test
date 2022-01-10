class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  helper_method :current_company

  def current_company
    Company.first
  end
end

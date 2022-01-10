# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  layout 'auth', only: %i[new create]
  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    authorize @user
    @user.build_user_info if @user.user_info.blank?
    @user.build_user_profile if @user.user_profile.blank?
    super
  end

  # PUT /resource
  def update
    authorize @user
    return render :edit, flash: { notice: 'update orror' } unless password_not_error?
    return redirect_to root_path, flash: { notice: 'update success' } if @user.update(user_params)

    render :edit, flash: { notice: 'update orror' }
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  def password_not_error?
    @user.valid_password?(params.dig(:user, :current_password)) &&
      params.dig(:user, :password_confirmation) == params.dig(:user, :password)
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  private

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation,
      :step, user_profile_attributes: %i[name phone date_of_birth address]
    )
  end
end

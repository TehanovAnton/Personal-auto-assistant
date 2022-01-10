# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sign_in_unless_confirmed, unless: :devise_controller?

  protected

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number role])
  end

  def sign_in_unless_confirmed
    message = "Your email isn't confirmed"
    redirect_to new_user_session_path, alert: message unless user_confirmed?
  end

  def user_confirmed?
    return false unless current_user

    current_user.confirmed?
  end
end

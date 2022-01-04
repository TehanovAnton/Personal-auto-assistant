# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :set_user_from_omniauth, only: [:google_oauth2]

  def google_oauth2
    if @user.persisted?
      set_notice_and_confirm_user
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
  private

  def set_user_from_omniauth
    @user = User.from_omniauth(request.env['omniauth.auth'])
  end

  def set_notice_and_confirm_user
    flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
    @user.confirm unless @user.confirmed?
  end
end

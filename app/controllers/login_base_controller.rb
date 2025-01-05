# frozen_string_literal: true

class LoginBaseController < ApplicationController
  before_action :already_logged_in, except: [:logout]

  # Template Method: create_user
  # determined by child class
  def create_user(user_info, provider)
    raise NotImplementedError, "Subclasses must implement the 'create_user' method"
  end
  
  def login_process(provider)
    user_info = request.env['omniauth.auth']
    user = find_or_create_user(user_info, provider)
    create_session(user)
    redirect_to_destination
  end

  private

  # determined by child class
  def create_session(user)
    session[:current_user_id] = user.id
  end

  # same method for every types
  def find_or_create_user(user_info, provider)
    user = User.find_by(
      provider: provider,
      uid:      user_info['uid']
    )
    return user unless user.nil?

    create_user(user_info, provider)
  end

  def redirect_to_destination
    destination_url = session[:destination_after_login] || root_url
    session[:destination_after_login] = nil
    redirect_to destination_url
  end

  def already_logged_in
    redirect_to user_profile_path, notice: 'You are already logged in. Logout to switch accounts.' if session[:current_user_id].present?
  end
end

# frozen_string_literal: true

class LoginController < ApplicationController
  before_action :already_logged_in, except: [:logout]

  def login; end

  # We no longer need to define google_oauth2 or github methods, after refactoring.
  def logout
    session[:current_user_id] = nil
    redirect_to root_path, notice: 'You have successfully logged out.'
  end

  private

  def already_logged_in
    redirect_to user_profile_path, notice: 'You are already logged in. Logout to switch accounts.' if session[:current_user_id].present?
  end
end

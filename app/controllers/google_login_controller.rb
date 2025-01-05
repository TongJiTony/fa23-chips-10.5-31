# frozen_string_literal: true

class GoogleLoginController < LoginBaseController
  def google_oauth2
    login_process(:google_oauth2)
  end

  private

  def create_user(user_info, provider)
    User.create(
      uid:        user_info['uid'],
      provider:   User.providers[:google_oauth2],
      first_name: user_info['info']['first_name'],
      last_name:  user_info['info']['last_name'],
      email:      user_info['info']['email']
    )
  end
end

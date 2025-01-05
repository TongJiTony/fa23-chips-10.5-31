# frozen_string_literal: true

class GithubLoginController < LoginBaseController
  def github
    login_process(:github)
  end

  private

  def create_user(user_info, provider)
    # Github doesn't provide first_name, last_name as separate entries.
    name = user_info['info']['name']
    if name.nil?
      first_name = 'Anon'
      last_name = 'User'
    else
      first_name, last_name = name.strip.split(/\s+/, 2)
    end
    User.create(
      uid:        user_info['uid'],
      provider:   User.providers[:github],
      first_name: first_name,
      last_name:  last_name,
      email:      user_info['info']['email']
    )
  end
end
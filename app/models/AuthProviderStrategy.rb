# frozen_string_literal: true

# Strategy Interface
class AuthProviderStrategy
  def self.find_user(uid)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def self.provider_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Concrete Strategy for Google OAuth2
class GoogleOAuth2Strategy < AuthProviderStrategy
  def self.find_user(uid)
    User.find_by(provider: User.providers[:google_oauth2], uid: uid)
  end

  def self.provider_name
    'Google'
  end
end

# Concrete Strategy for GitHub
class GithubStrategy < AuthProviderStrategy
  def self.find_user(uid)
    User.find_by(provider: User.providers[:github], uid: uid)
  end

  def self.provider_name
    'Github'
  end
end
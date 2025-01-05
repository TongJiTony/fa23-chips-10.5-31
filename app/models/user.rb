# frozen_string_literal: true

# class User < ApplicationRecord
#   # Add more Authentication Providers here.
#   enum provider: { google_oauth2: 1, github: 2 }, _prefix: :provider

#   # Each (uid, provider) pair should be unique.
#   validates :uid, uniqueness: { scope: :provider }

#   def name
#     "#{first_name} #{last_name}"
#   end

#   def auth_provider
#     {
#       'google_oauth2' => 'Google',
#       'github'        => 'Github'
#       # other providers could be added if necessary
#     }[provider]
#   end

#   def self.find_google_user(uid)
#     User.find_by(
#       provider: User.providers[:google_oauth2],
#       uid:      uid
#     )
#   end

#   def self.find_github_user(uid)
#     User.find_by(
#       provider: User.providers[:github],
#       uid:      uid
#     )
#   end
# end

class User < ApplicationRecord
  # Add more Authentication Providers here.
  enum provider: { google_oauth2: 1, github: 2 }, _prefix: :provider

  # Each (uid, provider) pair should be unique.
  validates :uid, uniqueness: { scope: :provider }

  def name
    "#{first_name} #{last_name}"
  end

  PROVIDER_STRATEGIES = {
    'google_oauth2' => GoogleOAuth2Strategy,
    'github'        => GithubStrategy
  }.freeze

  # Use strategy pattern to get the provider name
  def auth_provider
    strategy_class = PROVIDER_STRATEGIES.fetch(provider) do
      raise "Unknown provider: #{provider}"
    end

    strategy_class.provider_name
  end

  # Use strategy pattern to find user by provider and uid
  def self.find_user_by_provider(uid)
    strategy_class = PROVIDER_STRATEGIES.fetch(provider) do
      raise "Unknown provider: #{provider}"
    end

    strategy_class.find_user(uid)
  end
end
Feature: check account log in by third party authentication

Scenario: Login via Github account
  Given I am on the login page
  When I press "Sign in with GitHub"

Scenario: Login via Google account
  Given I am on the login page
  When I press "Sign in with Google"

Scenario: Logout the account
  Given I am on the logout page
  Then I should see "You have successfully logged out."
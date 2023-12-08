Feature: Add news items based on rep and issue

Background:
  Given I am on the login page
  Then I press "Sign in with Google"
  Given I search representatives of CA

Scenario: Search top 5 news with representative and issues
  When I click the "News Articles" link for "Joseph R. Biden"
  And I choose the link "Add News Article"
  And I select "Joseph R. Biden" from the "Representative" dropdown
  And I select "Free Speech" from the "Issue" dropdown
  And I press "Search"
  Then I should see "The Challenge of Trip"
  When I select the radio option with title "The Challenge of Trip"
  And I select "8" from the "Rating" dropdown
  And I press "Save"
  Then I should see "News item was successfully created."
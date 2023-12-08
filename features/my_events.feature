Feature: View, search and edit events

Background:
  Given I go to the login page
  Then I press "Sign in with Google"
  Given I am on the events page
  Then I choose the link "Reset Filters"

Scenario: Add an event
  When I choose the link "Add New Event"
  Then I should see "New event"

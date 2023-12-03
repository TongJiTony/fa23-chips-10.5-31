Feature: display profiles and test functionality

Scenario: Navigate to Biden's Profile
  Given I search representatives of CA
  When I click the "view profile" link for "Joseph R. Biden"
  Then I should see "Name: Joseph R. Biden"
  And I should see "Title: President of the United States"
  And I should see "Party: Democratic Party"

Scenario: Navigate back to representative page
  Given I search representatives of CA
  When I click the "view profile" link for "Joseph R. Biden"
  Then I choose the link "Back"
  Then I should see "Search for a Representative"
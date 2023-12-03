Feature: display profiles

Scenario: Navigate to Biden's Profile
  Given I search representatives of CA
  When I click the "view profile" link for "Joseph R. Biden"
  Then I should see "Name: Joseph R. Biden"
  And I should see "Title: President of the United States"
  And I should see "Party: Democratic Party"
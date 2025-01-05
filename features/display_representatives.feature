Feature: display representatives

Scenario: display representatives in San Diego county from the representatives page
  Given I am on the representatives page
  When I fill in "address" with "San Diego"
  And I press "Search"
  Then I should see "Joseph R. Biden"
  And I should see "Jordan Z. Marks"
  And I should not see "Karen Bass"

Scenario: display representatives in San Diego county from the map page
  Given I am on the home page
  When I go to the San Diego, CA page
  Then I should see "Joseph R. Biden"
  And I should see "Jordan Z. Marks"
  And I should not see "Karen Bass"

Scenario: display representative's news article page
  Given I search representatives of CA
  When I click the "News Articles" link for "Joseph R. Biden"
  And I should see "Listing News Articles for Joseph R. Biden"
  When I choose the link "Add News Article"
Feature: display representatives on the map based on the county

Scenario: search for CA in search bar
  Given I am on the representatives page
  When I fill in "address" with "CA"
  And I press "Search"
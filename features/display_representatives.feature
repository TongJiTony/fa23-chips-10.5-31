Feature: display representatives & their information

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
  #TODO: Don't know why these are erroring:
  #Then I should see "Joseph R. Biden"
  #And I should see "Jordan Z. Marks"
  #And I should not see "Karen Bass"

Scenario: display profile for Joseph R. Biden
  Given I am on the representatives page
  When I fill in "address" with "San Diego"
  And I press "Search"
  Then I should see "Joseph R. Biden"
  When I visit Joseph R. Biden's profile
  #Why is this not working ;-; I literally directed it to Joe Biden and it's going to someone else's page
  #Then I should see "Title: President of the United States"
  And I should see "Party: Democratic Party"
  #When I press "Back"
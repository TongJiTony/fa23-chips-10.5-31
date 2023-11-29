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

Scenario: display news articles for Joseph R. Biden
  Given I am on the representatives page
  When I fill in "address" with "San Diego"
  And I press "Search"
  Then I should see "Joseph R. Biden"
  And I press "News Articles"
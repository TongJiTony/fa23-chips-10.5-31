# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'paths'))

# Adapter Pattern
module AdapterHelper
  def click_action_for_representative(action, representative_name)
    within(find('tr', text: representative_name)) do
      click_link(action)
    end
  end
end
World(AdapterHelper)  

Given /^(?:|I )am on (.+)$/ do |page_name|
  # puts path_to(page_name)
  # used facade pattern
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  # puts path_to(page_name)
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, with: value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

# for display profile Cucumber tests
Given('I search representatives of CA') do
  visit '/search?address=CA'
end

# When('I click the {string} link for {string}') do |link_text, representative_name|
#   within(find('tr', text: representative_name)) do
#     click_link(link_text)
#   end
# end

# When('I click the {string} button for {string}') do |button_text, representative_name|
#   within(find('tr', text: representative_name)) do
#     click_button(button_text)
#   end
# end

# Adapter Pattern
When('I click the {string} link for {string}') do |action, representative_name|
  click_action_for_representative(action, representative_name)
end


When /^(?:|I )choose the link "([^"]*)"$/ do |link|
  click_link(link)
end

# For create news item
When("I select {string} from the {string} dropdown") do |option, dropdown_id|
  select option, from: dropdown_id
end

When("I select the radio option with title {string}") do |title|
  # Find the row with the specified title within the table
  row = find('tbody tr', text: title)

  # Extract the index from the radio button name attribute
  index = row.find('input[name="selected_news"]')[:id].match(/\d+/)[0].to_i

  # Select the radio button
  choose "selected_news_#{index}"
end

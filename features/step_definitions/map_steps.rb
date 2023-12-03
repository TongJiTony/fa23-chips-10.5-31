# frozen_string_literal: true

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'support', 'paths'))

Given /^(?:|I )am on (.+)$/ do |page_name|
  # puts path_to(page_name)
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

When('I click the {string} link for {string}') do |link_text, representative_name|
  within(find('tr', text: representative_name)) do
    click_link(link_text)
  end
end

When /^(?:|I )choose the link "([^"]*)"$/ do |link|
  click_link(link)
end

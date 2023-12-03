require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^(?:|I )am on (.+)$/ do |page_name|
  #puts path_to(page_name)
  visit path_to(page_name)
end

When /^(?:|I )go to (.+)$/ do |page_name|
  #puts path_to(page_name)
  visit path_to(page_name)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_button(button)
end

When /^(?:|I )visit (Joseph R. Biden)'s profile$/ do |name|
  #Representative.find(params[representative_id:3])
  visit show_representative_path(id:3)
end
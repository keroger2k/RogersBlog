Given /^I am not authenticated$/ do
  visit('/users/sign_out')
end

Given /^I have a user with email address "([^"]*)"$/ do |email|
  Factory.create(:user, :email => email)  
end

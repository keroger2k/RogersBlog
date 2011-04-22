When /^I display the post$/ do
  visit "/posts/#{@post.id}"
end

Given /^I have a user with email "([^"]*)"$/ do |email|
  User.new(:email => email) 
end

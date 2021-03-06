Given /^I have an authenticated user with email "([^"]*)"$/ do |email|
  password = "secretpassword"
  Given %{I have one user "#{email}" with password "#{password}"}
  And %{I go to login}
  And %{I fill in "user_email" with "#{email}"}
  And %{I fill in "user_password" with "#{password}"}
  And %{I press "Sign in"}
end

Given /^I have one\s+user "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
    User.new(:email => email,
       :password => password,
       :password_confirmation => password).save!
end

When /^I edit the post$/ do
  visit "/admin/posts/#{@post.id}/edit"
end

Given /^I visit the admin posts page$/ do
  visit "/admin/posts"
end

When /^I delete post$/ do
 click_link('Delete') 
end



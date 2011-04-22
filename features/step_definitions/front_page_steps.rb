Given /^I have a post$/ do
  @post = Post.create
end

Given /^my post has a title "([^"]*)"$/ do |title|
  @post.title = title
  @post.save
end

Given /^my post has body "([^"]*)"$/ do |body|
  @post.body = body 
  @post.save
end

Given /^my post has author with email "([^"]*)"$/ do |email|
  User.new(:email => email, :password => "abcd1234", :password_confirmation => "abcd1234").save!
  @post.user = User.find_by_email(email)
  @post.save
end

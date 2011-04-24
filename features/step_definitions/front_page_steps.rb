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
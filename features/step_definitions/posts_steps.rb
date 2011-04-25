When /^I display the post$/ do
  visit "/posts/#{@post.id}"
end

Given /^I have a post$/ do
  @post = Post.new
end

Given /^my post has a title "([^"]*)"$/ do |title|
  @post.title = title
  @post.save
end

Given /^my post has body "([^"]*)"$/ do |body|
  @post.body = body
  @post.save
end

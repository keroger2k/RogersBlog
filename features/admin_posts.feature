Feature: Post Management 
  In order to provide quality content
  As an Author
  I need to be able to manage posts
  
  Scenario: Create Post 
    Given I have an authenticated user with email "kyle.rogers@gmail.com"
    When I go to the new post page 
    And I fill in "post[title]" with "My Post Title"
    And I fill in "post[body]" with "This is my post. Something here."
    And I press "Create Post"
    Then I should see "My Post Title"
    And I should see "This is my post. Something here."
    
  Scenario: Edit Post 
    Given I have an authenticated user with email "kyle.rogers@gmail.com"
    And I have a post
    And my post has a title "My Post"
    And my post has body "This is my post."
    When I edit the post 
    And I fill in "post[title]" with "My Post Title"
    And I fill in "post[body]" with "This is my post. Something here."
    And I press "Update Post"
    Then I should see "My Post Title"
    And I should see "This is my post. Something here."
    
  Scenario: Delete Post 
    Given I have an authenticated user with email "kyle.rogers@gmail.com"
    And I have a post
    And my post has a title "My Post"
    And my post has body "This is my post."
    And I visit the admin posts page
    When I delete post
    Then I should not see "My Post"
    And I should not see "This is my post."

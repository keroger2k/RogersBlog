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
    And I should see "kyle.rogers@gmail.com"

Feature: Post Display 
  In order to display my posts
  I need to be able to show my posts

  Scenario: Show Post 
    Given I have a post
    And my post has a title "My Post"
    And my post has body "This is my post."
    And my post has author with email "kyle.rogers@gmail.com"
    When I display the post 
    Then I should see "My Post"
    And I should see "This is my post"
    And I should see "kyle.rogers@gmail.com"

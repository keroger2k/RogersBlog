Feature: Post Display 

  Scenario: Show Post 
    Given I have a post
    And my post has a title "My Post"
    And my post has body "This is my post."
    When I display the post 
    Then I should see "My Post"
    And I should see "This is my post1"

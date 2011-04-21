Feature: Front Page
  In order to see the most relevant posts
  As a reader
  I want the 5 most recent posts on the front page
  
  Scenario: 1 post in blog
    Given I have a post
    And my post has a title "My Post"
    And my post has body "This is my post."
    And my post has author with name "Kyle Rogers"
    And my post was published on "April 20, 2011"
    When I go to the homepage
    Then I should see "<h2>My Post</h2>"
    And I should see "This is my post"
    And I should see "Kyle Rogers"
    And I should see "April 20, 2011"
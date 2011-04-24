Feature: Front Page
  In order to see the most relevant posts
  As a reader
  I want to see all the post ordered by descending date
  
  Scenario: 1 post in blog
    Given I have a post
    And my post has a title "My Post"
    And my post has body "This is my post."
    When I go to the homepage
    Then I should see "My Post"
    And I should see "This is my post"

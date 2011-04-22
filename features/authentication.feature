Feature: Authentication 
  To ensure user are authenticated correctly
  As a non-registered user
  I want to be able to create a new account
  As a registered user
  I want to be able to login


  Scenario Outline: Creating a new account
    Given I am not authenticated
    When I go to register 
    And I fill in "user_email" with "<email>"
    And I fill in "user_password" with "<password>"
    And I fill in "user_password_confirmation" with "<password>"
    And I press "Sign up"
    Then I should see "<email>" 

    Examples:
      | email           | password   |
      | testing@man.net | secretpass |
      | foo@bar.com     | fr33z3     |

  Scenario:
    Given I have a user with email address "kyle.rogers@gmail.com"
    When I go to the login page
    And I fill in "user_email" with "kyle.rogers@gmail.com"
    And I fill in "user_password" with "password"
    And I press "Sign in"
    Then I should see "kyle.rogers@gmail.com"


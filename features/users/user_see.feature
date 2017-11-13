@users
Feature: As a admin user I want to see user

  Background:
    Given I am logged in as admin

  Scenario: Get user
    When I get "1" user
    Then I expect successful response
    And I expect valid json response
    And response should contains valid user
    And I should see user data
      | username          |  email             | first_name      | last_name       | status |
      | user@example.com |  user@example.com | FirstName user1 | LastName user1  | true   |
    And I should see user roles
      | role                  |
      | ROLE_SUPER_ADMIN      |
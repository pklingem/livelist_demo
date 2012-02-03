@javascript
Feature: List Users
  In order to manage users
  As a user
  I want to see a paginated, filterable list of users

  Background:
    Given 50 users exist in the database
    And I visit the users index page

  Scenario: Patients are listed
    Then I should see 30 users
    And I should see pagination links
    And I should see filters

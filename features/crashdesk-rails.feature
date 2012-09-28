Feature: Integration
  In order to validate integration of crashdesk-rails plugin
  As a normal user
  I want well working plugin

  Scenario: Normal error happens
    Given remote harvester for exceptions is running
    And reporting goes to remote
    When I go to the users page
    Then I should see error page

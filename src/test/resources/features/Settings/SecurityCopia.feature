@Regression @Security
Feature: Security

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the category Security 
 
 
  @Smoke @SmokeManual @LockTimeout
  Scenario Outline: Security - Lock Timeout
    When the user clicks the "Lock timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    And wait <timeout> of time
    Then view screen lock

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |
      
 	@Smoke @DeleteAfterFailedUnlock @SmokeManual
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    And the user close the app
    And the user set incorrect <PIN> in <attempts>
    Then the files have been deleted

    Examples:
      | attempts    | PIN    |
      | 5 attempts  | 123450 |
      | 10 attempts | 123451 |
      | 20 attempts | 123450 |   
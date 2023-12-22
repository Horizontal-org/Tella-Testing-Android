@Smoke @Unlock
Feature: As a potential client i want to interact with the mobile application

  Background:
    Given The app is loaded correctly

  @Password @Automated
  Scenario Outline: The user start the application, unlock the app with a password.
    When The user set a password <password>
    When The user click the go to tella button
    Then Home page is displayed

    Examples:
      | password |
      | 123456   |


  @Pin @Automated
  Scenario Outline: The user start the application, unlock the app with a pin.
    When The user set a pin <pin>
    When The user click the go to tella button
    Then Home page is displayed

    Examples:
      | pin    |
      | 654321 |


  @Pattern @Ignore
  Scenario: The user start the application, unlock the app with a pattern.
    When The user set a pattern
    When The user click the go to tella button
    Then Home page is displayed



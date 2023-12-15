@Smoke
Feature: As a potential client i want to interact with the mobile application

Background:
  Given The app is loaded correctly

@Password
Scenario Outline: The user starts the application, log in to the app and set a password.
  When The user set a password <password>
  When The user click the go to tella button
  Then Home page is displayed

Examples:
  | password |
  | 123456   |


  @Pin
  Scenario Outline: The user starts the application, log in to the app and set a pin.
    When The user set a pin <pin>
    When The user click the go to tella button
    Then Home page is displayed

  Examples:
    | pin    |
    | 654321 |



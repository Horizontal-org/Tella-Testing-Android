@Smoke @Unlock
Feature: Unlock


  @Password @Automated
  Scenario Outline: The user start the application, unlock the app with a password.
    Given the user is in Tella home page
    And the user close the app
    And The app is loaded correctly with a password set
    When The user enter the password <password>
    Then Home page is displayed

    Examples:
      | password |
      | 123456   |


  @Pin @Automated
  Scenario Outline: The user start the application, unlock the app with a pin.
    Given the user is in Tella home page and log in with pin <pin>
    And the user close the app
    And The app is loaded correctly with a pin set
    When The user enter the pin <pin>
    Then Home page is displayed

    Examples:
      | pin    |
      | 654321 |


  @Pattern
  Scenario: The user start the application, unlock the app with a pattern.
    Given The app is loaded correctly with a pattern set
    When The user set a pattern
    When The user click the go to tella button
    Then Home page is displayed



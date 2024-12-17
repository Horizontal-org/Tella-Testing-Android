@Regression @Unlock
Feature: Unlock

  @Smoke @Password @SmokeManual #This test cannot be run in browserStack
  Scenario Outline: Unlock the app with a password.
    Given the user is in Tella home page
    And the user close the app
    And The app is loaded correctly with a password set
    When The user enter the password <password>
    Then Home page is displayed

    Examples:
      | password |
      | 123456   |

  @Smoke @Pin @Automated @IOS
  Scenario Outline: Unlock the app with a pin.
    Given the user is in Tella home page and log in with pin <pin>
    And the user close the app
    And The app is loaded correctly with a pin set
    When The user enter the pin <pin>
    Then Home page is displayed

    Examples:
      | pin    |
      | 654321 |

  @Pattern @Password
  Scenario: The user start the application, unlock the app with a pattern.
    Given The app is loaded correctly with a pattern set
    When The user set a pattern
    And The user click the go to tella button
    Then Home page is displayed



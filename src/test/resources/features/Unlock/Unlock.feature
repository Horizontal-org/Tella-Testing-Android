@Regression @Unlock
Feature: Unlock

Background:
    Given The user is already registered
    And The user opens the app

  @Smoke @Password @E2E @Candidate #This test cannot be run in browserStack
  Scenario Outline: Unlock the app with a password
    And The user uses the unlock method password
    When The user enter the password <password>
    And The user taps the button "Unlock"
    Then Home page is displayed

    Examples:
      | password |
      | 123456   |
      | abc123   |
      

  @Password @Candidate #This test cannot be run in browserStack
  Scenario Outline: Unlock fails with wrong password
    And The user uses the unlock method password
    When The user enter the password <wrong_password>
    And The user taps the button "Unlock"
    Then a message <message> is displayed to the user
    And Home page is not displayed

    Examples:
      | wrong_password | message                           |
      | abcabc         | Incorrect password. Please try again. |

  @Smoke @Pin @Candidate @E2E
  Scenario Outline: Unlock the app with a pin
    And The user uses the unlock method pin
    When The user enter the pin <pin>
    And The user taps the button "OK"
    Then Home page is displayed

    Examples:
      | pin    |
      | 654321 |

  @Pin @Candidate
  Scenario Outline: Unlock fails with wrong pin
    And The user uses the unlock method pin
    When The user enter the pin <wrong_pin>
    And The user taps the button "OK"
    Then a message <message> is displayed to the user
    And Home page is not displayed

    Examples:
      | wrong_pin | message                      |
      | 111111    | Incorrect. Please try again. |

  @Smoke @Pattern @Candidate @E2E
  Scenario: Unlock the app with a pattern
    And The user uses the unlock method pattern
    When The user draws the pattern
    Then Home page is displayed

  @Pattern @Candidate
  Scenario Outline: Unlock fails with wrong pattern
    And The user uses the unlock method pattern
    When The user draws a different pattern connecting at least 6 dots
    Then a message "<message>" is displayed to the user
    And Home page is not displayed

    Examples:
      | message                      |
      | Incorrect pattern. Please try again. |
      
@Regression @Unlock
Feature: Unlock

  @Smoke @Password @E2E @ToBeAutomated #This test cannot be run in browserStack
  Scenario Outline: Unlock the app with a password
    And The user uses the unlock method password
    And the user opens the app
    And The app is loaded correctly with a password set
    When The user enter the password <password>
    Then Home page is displayed

    Examples:
      | password |
      | 123456   |

  @Password @ToBeAutomated #This test cannot be run in browserStack
  Scenario Outline: Unlock fails with wrong password
    And The user uses the unlock method password
    And the user opens the app
    When The user enter the password <wrong_password>
    Then a message "<message>" is displayed to the user
    And Home page is not displayed

    Examples:
      | wrong_password | message                           |
      | abcabc         | Wrong password. Please try again. |

  @Smoke @Pin @ToBeAutomated @E2E
  Scenario Outline: Unlock the app with a pin
    And The user uses the unlock method pin
    And the user opens the app
    When The user enter the pin <pin>
    Then Home page is displayed

    Examples:
      | pin    |
      | 654321 |

  @Pin @ToBeAutomated
  Scenario Outline: Unlock fails with wrong pin
    And The user uses the unlock method pin
    And the user opens the app
    When The user enter the pin <wrong_pin>
    Then a message "<message>" is displayed to the user
    And Home page is not displayed

    Examples:
      | wrong_pin | message                      |
      | 111111    | Wrong PIN. Please try again. |

  @Smoke @Pattern @ToBeAutomated @E2E
  Scenario: Unlock the app with a pattern
    And The user uses the unlock method pattern
    And the user opens the app
    When the user draws the pattern
    Then Home page is displayed

  @Pattern @ToBeAutomated
  Scenario Outline: Unlock fails with wrong pattern
    And The user uses the unlock method pattern
    And the user opens the app
    When the user draws a different pattern with no less than six points
    Then a message "<message>" is displayed to the user
    And Home page is not displayed

    Examples:
      | message                      |
      | Wrong PIN. Please try again. |
@Regression @Lock
Feature: Lock Options

  Background:
    Given The user opens the app for the first time

  @Smoke @Password @Automated @E2E
  Scenario Outline: Register with password
    When the user taps the Next button until reaching the lock options
    And the user taps the Password button
    And the user taps the I UNDERSTAND button
    And the user types a password <password>
    And the user taps the Next button
    And the user types a password <password>
    And the user taps the Next button
    And the user taps the CONTINUE button
    And the user taps the Success screen Next button
    Then a successfully registered message <message> is displayed to the user
    And the user taps the GO TO TELLA button
    And the home page is displayed

    Examples:
      | password | message          |
      | abcdef   | You’re all done! |

  @Smoke @Password @Automated
  Scenario Outline: Failed register - password confirmation
    When the user taps the Next button until reaching the lock options
    And the user taps the Password button
    And types a password <password_a>
    And the user taps the Next button
    And types a password <password_b>
    And the user taps the Next button
    Then a message <message> is displayed to the user

    Examples:
      | password_a | password_b | message                                        |
      | abcdef     | abcabc     | Please try again. Your passwords do not match. |

  @Smoke @Password @Automated
  Scenario Outline: Failed register - password lenght
    When the user taps the Next button until reaching the lock options
    And the user taps the Password button
    And types a password <password>
    Then the next button remains disabled

    Examples:
      | password |
      | abcde    |

  @Smoke @Pin @Automated @E2E
  Scenario Outline: Register with PIN
    When the user taps the Next button until reaching the lock options
    And the user taps the PIN button
    And the user taps the I UNDERSTAND button
    And the user types a pin <PIN>
    And the user taps the OK button
    And the user types a pin <PIN>
    And the user taps the OK button
    And the user taps the CONTINUE button
    And the user taps the Success screen Next button
    Then a successfully registered message <message> is displayed to the user
    And the user taps the GO TO TELLA button
    And the home page is displayed


    Examples:
      | PIN    | message          |
      | 123456 | You’re all done! |

  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - pin don't match
    When the user taps the Next button until reaching the lock options
    And the user taps the PIN button
    And types a pin <PIN_a>
    And the user taps the OK button
    And types a pin <PIN_b>
    And the user taps the OK button
    Then a message <message> is displayed to the user

    Examples:
      | PIN_a  | PIN_b  | message                                   |
      | 123456 | 654321 | Please try again. Your PINs do not match. |

  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - PIN lenght
    When the user taps the Next button until reaching the lock options
    And the user taps the PIN button
    And types a pin <PIN>
    Then the next pin button remains disabled

    Examples:
      | PIN   |
      | 12345 |

  @Smoke @Pattern @ToBeAutomated @E2E
  Scenario Outline: Register with pattern
    When the user taps the Next button until reaching the lock options
    And tap the pattern button
    And the user draws a pattern
    And the user taps the Next button
    And the user draws a pattern
    And the user taps the Next button
    Then a successfully registered message <message> is displayed to the user and a link to landing page
    And the user presses the go to tella button
    And the user is in Tella home page

    Examples:
      | message                                                     |
      | Your lock is set up! You can change it anytime in Settings. |

  @Smoke @Pattern @ToBeAutomated
  Scenario Outline: Failed Pattern confirmation - Patterns don't match
    When the user taps the Next button until reaching the lock options
    And tap the pattern button
    And the user draws a pattern
    And the user taps the Next button
    And the user draws a different pattern with no less than six points
    And the user taps the Next button
    Then a message <message> is displayed to the user

    Examples:
      | message                                   |
      | Please try again. Your PINs do not match. |







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
    And the user taps the I UNDERSTAND button
    And the user types a password <password_a>
    And the user taps the Next button
    And the user types a password <password_b>
    And the user taps the Next button
    Then a message <message> is displayed to the user

    Examples:
      | password_a | password_b | message                                        |
      | abcdef     | abcabc     | Please try again. Your passwords do not match. |
      | 123456     | 567890     | Please try again. Your passwords do not match. |
      | #$%123     | 123#$%     | Please try again. Your passwords do not match. |

  @Smoke @Password @Automated
  Scenario Outline: Failed register - password length
    When the user taps the Next button until reaching the lock options
    And the user taps the Password button
    And the user taps the I UNDERSTAND button
    And the user types a password <password>
    Then the next button remains disabled

    Examples:
      | password |
      | abcde    |
      | 12345    |

  @Smoke @Pin @Automated @E2E
  Scenario Outline: Register with PIN
    When the user taps the Next button until reaching the lock options
    And the user taps the PIN button
    And the user taps the I UNDERSTAND button
    And the user types a pin <PIN>
    And the user taps the button <button>
    And the user types a pin <PIN>
    And the user taps the button <button>
    And the user taps the CONTINUE button
    And the user taps the Success screen Next button
    Then a successfully registered message <message> is displayed to the user
    And the user taps the GO TO TELLA button
    And the home page is displayed

    Examples:
      | PIN    | button | message          |
      | 123456 | OK     | You’re all done! |
      | 000000 | Next   | You’re all done! |

  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - pin don't match
    When the user taps the Next button until reaching the lock options
    And the user taps the PIN button
    And the user taps the I UNDERSTAND button
    And the user types a pin <PIN_a>
    And the user taps the button <button>
    And the user types a pin <PIN_b>
    And the user taps the button <button>
    Then a message <message> is displayed to the user

    Examples:
      | PIN_a      | PIN_b     | button | message                                   |
      | 123456     | 654321    | OK     | Please try again. Your PINs do not match. |
      | 0987654321 | 098765432 | Next   | Please try again. Your PINs do not match. |

  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - PIN length
    When the user taps the Next button until reaching the lock options
    And the user taps the PIN button
    And the user taps the I UNDERSTAND button
    And the user types a pin <PIN>
    Then Then the button <button> does not proceed to the next step

    Examples:
      | PIN   | button |
      | 1     | OK     |
      | 12345 | Next   |

  @Smoke @Pattern @Automated @E2E
  Scenario Outline: Register with pattern
    When the user taps the Next button until reaching the lock options
    And the user taps the Pattern button
    And the user taps the I UNDERSTAND button
    And the user draws a pattern connecting at least <dots> dots
    And the user taps the Next Pattern button
    And the user draws a pattern connecting at least <dots> dots
    And the user taps the CONTINUE button
    And the user taps the Success screen Next button
    Then a successfully registered message <message> is displayed to the user
    And the user taps the GO TO TELLA button
    And the home page is displayed

    Examples:
      | dots | message          |
      | 6    | You’re all done! |
      | 7    | You’re all done! |
      | 8    | You’re all done! |

  @Smoke @Pattern @Automated
  Scenario Outline: Failed Pattern confirmation - Patterns don't match
    When the user taps the Next button until reaching the lock options
    And the user taps the Pattern button
    And the user taps the I UNDERSTAND button
    And the user draws a pattern connecting at least <dots_a> dots
    And the user taps the Next Pattern button
    And the user draws a pattern connecting at least <dots_b> dots
    Then a message <message> is displayed to the user

    Examples:
      | dots_a | dots_b | message                                       |
      | 6      | 1      | Please try again. Your patterns do not match. |
      | 7      | 5      | Please try again. Your patterns do not match. |
      | 8      | 2      | Please try again. Your patterns do not match. |

  @Smoke @Pattern @Automated
  Scenario Outline: Failed Pattern confirmation - Pattern length
    When the user taps the Next button until reaching the lock options
    And the user taps the Pattern button
    And the user taps the I UNDERSTAND button
    And the user draws a pattern connecting at least <dots> dots
    Then the Next button remains disabled

    Examples:
      | dots |
      | 2    |
      | 3    |
      | 4    |
      







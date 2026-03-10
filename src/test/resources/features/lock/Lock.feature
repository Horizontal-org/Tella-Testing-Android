@Regression @Lock
Feature: Lock Options

  Background:
    Given The user opens the app for the first time

  @Smoke @Password @Automated @E2E
  Scenario Outline: Register with password
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Password" button
    And tap the "I UNDERSTAND" button
    And types a password <password_a>
    And tap the "Next" button
    And types a password <password_b>
    And tap the "Next" button
    And tap the "CONTINUE" button
    And tap the "Next" button
    Then a successfully registered message <message> is displayed to the user and a link to landing page
    And tap the "GO TO TELLA" button
    And the user is in Tella home page

    Examples:
      | password_a   |  password_b   |           message                                                                                    |
      |   abcdef     |    abcdef     | You re all done! You can go to Tella now, or continue customizing Tella to set up advanced settings.| 
      |   123456     |    123456     | You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings.|
      |   @+1234     |    @+1234     | You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings.|

  @Smoke @Password @Automated
  Scenario Outline: Failed register - password confirmation
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Password" button
    And tap the "I UNDERSTAND" button
    And types a password <password_a>
    And tap the "Next" button
    And types a password <password_b>
    And tap the "Next" button
    Then a message <message> is displayed to the user

    Examples:
      | password_a | password_b | message                                        |
      | abcdef     | abcabc     | Please try again. Your passwords do not match. |
      | 123456     | 567890     | Please try again. Your passwords do not match. |
      | #$%123     | 123#$%     | Please try again. Your passwords do not match. |
      
  @Smoke @Password @Automated
  Scenario Outline: Failed register - password lenght
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Password" button
    And tap the "I UNDERSTAND" button
    And types a password <password>
    Then the next button remains disabled

    Examples:
      | password |
      | abcde    |
      | 12345    |

  @Smoke @Pin @Automated @E2E
  Scenario Outline: Register with PIN
    When tap the next button until reaching the lock options
    And tap the pin button
    And types a pin <PIN>
    And tap the next pin button
    And types a pin <PIN>
    And tap the next pin button
    Then a successfully registered message <message> is displayed to the user and a link to landing page
    And the user presses the go to tella button
    And the user is in Tella home page


    Examples:
      | PIN    | message                                                     |
      | 123456 | Your lock is set up! You can change it anytime in Settings. |

  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - pin don't match
    When tap the next button until reaching the lock options
    And tap the pin button
    And types a pin <PIN_a>
    And tap the next pin button
    And types a pin <PIN_b>
    And tap the next pin button
    Then a message <message> is displayed to the user

    Examples:
      | PIN_a  | PIN_b  | message                                   |
      | 123456 | 654321 | Please try again. Your PINs do not match. |

  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - PIN lenght
    When tap the next button until reaching the lock options
    And tap the pin button
    And types a pin <PIN>
    Then the next pin button remains disabled

    Examples:
      | PIN   |
      | 12345 |

  @Smoke @Pattern @ToBeAutomated @E2E
  Scenario Outline: Register with pattern
    When tap the next button until reaching the lock options
    And tap the pattern button
    And the user draws a pattern
    And tap the next button
    And the user draws a pattern
    And tap the next button
    Then a successfully registered message <message> is displayed to the user and a link to landing page
    And the user presses the go to tella button
    And the user is in Tella home page

    Examples:
      | message                                                     |
      | Your lock is set up! You can change it anytime in Settings. |

  @Smoke @Pattern @ToBeAutomated
  Scenario Outline: Failed Pattern confirmation - Patterns don't match
    When tap the next button until reaching the lock options
    And tap the pattern button
    And the user draws a pattern
    And tap the next button
    And the user draws a different pattern with no less than six points
    And tap the next button
    Then a message <message> is displayed to the user

    Examples:
      | message                                   |
      | Please try again. Your PINs do not match. |







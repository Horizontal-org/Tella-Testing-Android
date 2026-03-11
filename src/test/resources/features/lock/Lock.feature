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
    Then a successfully registered message <message> is displayed to the user 
    And tap the "GO TO TELLA" button
    And the user is in Tella home page

    Examples:
      | password_a   |  password_b   |           message                                                                                   |
      |   abcdef     |    abcdef     | You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings.| 
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
  Scenario Outline: Failed register - password length
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Password" button
    And tap the "I UNDERSTAND" button
    And types a password <password>
    Then the "Next" button remains disabled

    Examples:
      | password |
      | abcde    |
      | 12345    |

  @Smoke @Pin @Automated @E2E
  Scenario Outline: Register with PIN
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "PIN" button
    And tap the "I UNDERSTAND" button
    And types a pin <PIN_a>
    And tap the "OK" button
    And types a pin <PIN_b>
    And tap the "OK" button
    And tap the "CONTINUE" button
    And tap the "Next" button
    Then a successfully registered message <message> is displayed to the user 
    And tap the "GO TO TELLA" button
    And the user is in Tella home page



    Examples:
      | PIN_a    | PIN_b   |         message                                                                                      |
      | 123456   | 123456  |  You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings.|
      | 000000   | 000000  |  You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings.|
      
  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - pin don't match
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "PIN" button
    And tap the "I UNDERSTAND" button
    And types a pin <PIN_a>
    And tap the "OK" button
    And types a pin <PIN_b>
    And tap the "OK" button
    Then a message <message> is displayed to the user

    Examples:
      | PIN_a       | PIN_b      | message                                   | 
      | 123456      | 654321     | Please try again. Your PINs do not match. |
      |  0987654321 | 098765432  | Please try again. Your PINs do not match. |
      
  @Smoke @Pin @Automated
  Scenario Outline: Failed PIN confirmation - PIN length
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "PIN" button
    And tap the "I UNDERSTAND" button
    And types a pin <PIN>
    Then the "OK" button remains disabled

    Examples:
      | PIN    |
      | 1      |
      | 123    |
      | 12345  |   

  @Smoke @Pattern @ToBeAutomated @E2E
  Scenario Outline: Register with pattern
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Pattern" button
    And tap the "I UNDERSTAND" button
    And the user draws a pattern connecting at least <dots> dots
    And tap the "Next" button
    And the user draws the same previous pattern connecting the <dots> dots
    And tap the "CONTINUE" button
    And tap the "Next" button
    Then a successfully registered message <message> is displayed to the user 
    And tap the "GO TO TELLA" button
    And the user is in Tella home page

    Examples:
    | dots      | message                                                     |
    | 6         | You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings |
    | 7         | You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings |
    | 8         | You're all done! You can go to Tella now, or continue customizing Tella to set up advanced settings |

  @Smoke @Pattern @ToBeAutomated
  Scenario Outline: Failed Pattern confirmation - Patterns don't match
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Pattern" button
    And tap the "I UNDERSTAND" button
    And the user draws a pattern connecting at least <dots_a> dots
    And tap the "Next" button
    And the user draws a different pattern connecting at least <dots_b> dots
    Then a message <message> is displayed to the user

    Examples:
    | dots_a   |  dots_b      | message                                    |
    | 6        |   6          | Please try again. Your patterns do not match. |
    | 7        |   5          | Please try again. Your patterns do not match.|
    | 8        |   3          | Please try again. Your patterns do not match.|
    
    @Smoke @Pattern @ToBeAutomated
  Scenario Outline: Failed Pattern confirmation - Pattern length
    When tap the "GET STARTED" button
    And tap the "Next" button until reaching the lock options
    And tap the "Pattern" button
    And tap the "I UNDERSTAND" button
    And the user draws a pattern connecting at least <dots> dots
    Then the "Next" button remains disabled
    
     Examples:
      | dots  |
      | 2     |
      | 3     |
      | 4     |
      







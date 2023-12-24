Feature: Lock Options

@Smoke @Password @Automated
Scenario Outline: register with password
  When tap the next button until reaching the lock options
  And tap the password button
  And types a password <password>
  And tap the next button
  And types a password <password>
  And tap the next button
  Then a successfully registered message <message> is displayed to the user and a link to landing page
  
  Examples:
    | password | message                                                     |
    | abcdef   | Your lock is set up! You can change it anytime in Settings. |


@Regression @Password @Automated
Scenario Outline: Failed password confirmation and lenght
  When tap the next button until reaching the lock options
  And tap the password button
  And types a password <password_a>
  And tap the next button
  And types a password <password_b>
  And tap the next button
  Then a message <message> is displayed to the user
  
  Examples:
    | password_a | password_b | message                                        |
    | abcdef     | abcabc     | Please try again. Your passwords do not match. |


@Regression @Password @Automated
Scenario Outline: Failed password lenght
  When tap the next button until reaching the lock options
  And tap the password button
  And types a password <password>
  Then the next button remains disabled
  
  Examples:
  | password  |
  | abcde     |


@Smoke @Pin @Automated
Scenario Outline: register with PIN
  When tap the next button until reaching the lock options
  And tap the pin button
  And types a pin <PIN>
  And tap the next pin button
  And types a pin <PIN>
  And tap the next pin button
  Then a successfully registered message <message> is displayed to the user and a link to landing page
  
  Examples:
    | PIN    | message                                                     |
    | 123456 | Your lock is set up! You can change it anytime in Settings. |


@Regression @Pin @Automated
Scenario Outline: Failed PIN confirmation
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


@Regression @Pin @Automated
Scenario Outline: Failed PIN lenght
  When tap the next button until reaching the lock options
  And tap the pin button
  And types a pin <PIN>
  Then the next pin button remains disabled
  
  Examples:
  | PIN   |
  | 12345 |


  @Smoke
  Scenario: register with pattern
    When the user tap the "EMPEZAR" button
    And tap the "Siguiente" button until reaching the lock options
    And tap the "Patrón" button
    And draws a pattern with no less than six points
    And tap the "Siguiente" button
    And draws the same pattern to confirm
    And tap the "Siguiente" button
    Then A successfully registered message is displayed to the user and a link to landing page


  @Regression
  Scenario: Failed pattern confirmation
    When the user tap the "EMPEZAR" button
    And tap the "Siguiente" button until reaching the lock options
    And tap the "Patrón" button
    And draws a pattern with no less than six points
    And tap the "Siguiente" button
    And draws a different pattern with no less than six points
    And tap the "Siguiente" button
    Then a message is displayed to the user, warning the patterns are not the same


  @Regression
  Scenario: Failed minimum number of points in pattern
    When the user tap the "EMPEZAR" button
    And tap the "Siguiente" button until reaching the lock options
    And tap the "Patrón" button
    And draws a pattern with a number of points less than six
    Then the "Siguiente" button remains disabled
  











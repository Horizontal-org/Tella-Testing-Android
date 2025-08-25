@Regression @TellaDesktop @RegisterAndLogIn @SmokeManual
Feature: Register, Login and Lock Tella Desktop

  @Register
  Scenario: Register a new account successfully
    Given the user opens the application for the first time
    When the user sets a password "Password2025"
    And the user presses the "Next" button
    And the user confirms the password "Password2025"
    And the user presses the "Save" button
    Then the user sees the message "Success!"
    And the user presses the "Go to tella" button

  @Register @Fail
  Scenario Outline: Register new account failed due to password length
    Given the user opens the application for the first time
    When the user sets a password <Password1>
    Then the user sees the message <fail>
    And the "Next" button remains disabled

    Examples:
      | Password1 | fail                       |
      | 123       | your password is too short |

  @Register @Fail
  Scenario Outline: Register new account failed due to mismatched password
    Given the user opens the application for the first time
    When the user sets a password <Password1>
    And the user presses the "Next" button
    And the user confirms the password <Password2>
    Then the user sees the message <fail>
    And the "Save" button remains disabled

    Examples:
      | Password1 | Password2 | fail                                                                   |
      | 123456ABC | ABC123456 | the password does not match the one you entered in the previous screen |

  @Login
  Scenario: Login success
    Given the user already has an account created in the Tella Desktop application
    When the user enters a valid password
    And the user presses the "Log in" button
    Then the user logs in to the application successfully

  @Login @Fail
  Scenario: Login failed
    Given the user already has an account created in the Tella Desktop application
    When the user enters an incorrect password
    And the user presses the "Log in" button
    Then the user sees the message "Invalid password"
    And the user cannot enter the application

  Scenario: Lock Tella desktop
    # we still cannot see how this feature works
  Given
  When
  Then

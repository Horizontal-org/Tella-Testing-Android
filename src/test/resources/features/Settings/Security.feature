@Regression @Security
Feature: Security

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the category Security

  @Smoke @ToBeAutomated @Lock
  Scenario Outline: Security - Lock - Change Password lock to PIN lock - <LockOption> option
    When the user clicks the "Lock" option
    And set security code valid
    And tap "<LockOption>" option
    And set <passPin>
    And taps "next" button
    And set confirm <passPin>
    And taps "next" button
    Then "Your lock has been changed" message is shown

    Examples:
      | passPin | LockOption |
      | 1234560 | Password   |
      | 1234560 | PIN        |

  @Lock @ToBeAutomated
  Scenario: Security - Lock - Change Password lock to Pattern lock
    When the user clicks the "Lock" option
    And set security code valid
    And taps "Pattern" option
    And set pattern
    And taps "next" button
    And set confirm pattern
    And taps "next" button
    Then "Your lock has been changed" message is shown

  @Smoke @SmokeManual @LockTimeout @Automated @E2E
  Scenario Outline: Security - Lock Timeout
    Given the user sets the app lock timeout to <timeout>
    When the user leaves the app, waits for the configured time <timeout> , and returns
    Then view screen lock

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      #| 5 minutes   |
      #| 30 minutes  |
      #| 1 hour      |

  @Smoke @LockTimeout @Automated @LockFlow
  Scenario Outline: Security - Change Lock Timeout
    When the user clicks the "Lock Timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    Then the option timeout <timeout> is selected

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      #| 5 minutes   |
      #| 30 minutes  |
      #| 1 hour      |

  @Smoke @LockTimeout @LockOnDeviceScreenOff @Automated @E2E
  Scenario Outline: Security - Lock on Device Screen Off
    Given the user sets the app lock timeout to <timeout>
    When the user locks the device screen, waits for the configured time <timeout>, and unlocks it
    Then The screen lock must be displayed in the application

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      #| 5 minutes   |
      #| 30 minutes  |
      #| 1 hour      |

  @Smoke @LockTimeout @DeleteAfterFailedUnlock @Automated @E2E
  Scenario Outline: Security - Delete after failed unlock - the Audio files are deleted
    Given the user records an audio file
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    And the sucessfull message <message> is displayed
    And the user closes and reopens the Tella app
    And the user set incorrect <PIN> in <attempts>
    Then the app displays the "Get started" screen to the user
    And that files were deleted

    Examples:
      | attempts   | PIN    | message                                                        |
      | 5 attempts | 123450 | Your Tella data will be deleted after 5 failed unlock attempts |
      #| 10 attempts | 123451 | Your Tella data will be deleted after 10 failed unlock attempts |
      #| 20 attempts | 123450 | Your Tella data will be deleted after 20 failed unlock attempts |

  @Smoke @DeleteAfterFailedUnlock @Automated @LockFlow
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    Then the sucessfull message <message> is displayed
    And The option show remaining unlock attempts will be displayed enabled

    Examples:
      | attempts                 | message                                                        |
      | Off (do not delete data) |                                                                |
      | 5 attempts               | Your Tella data will be deleted after 5 failed unlock attempts |
      #| 10 attempts               | Your Tella data will be deleted after 10 failed unlock attempts |
      #| 20 attempts               | Your Tella data will be deleted after 20 failed unlock attempts |

  @Camouflage @SmokeManual @E2E
  Scenario Outline: Security - camouflage - change camuflaje method - change name and icon
    When the user clicks the "Camouflage" option
    And The user enter the password <password>
    And select "CHANGE NAME AND ICON" option
    And select icon <icon> option
    And tap the next button
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <icon>

    Examples:
      | password | icon       | message                                                                     |
      | 123456   | MiCamera   | Please wait. You will return to your device's home screen in a few seconds. |
      | 123456   | Calculator | Please wait. You will return to your device's home screen in a few seconds. |

  @Camouflage @SmokeManual
  Scenario Outline: Security - camouflage - change camuflaje method - hide behind a calculator
    When the PIN is selected in lock option
    And the user clicks the "Camouflage" option
    And enter the valid PIN
    And select "HIDE BEHIND A CALCULATOR APP" option
    And select <calculator> option
    And taps "Exit Tella" button
    Then the message "<message>" is displayed
    And view the Tella icon changed for <calculator>

    Examples:
      | calculator   | message                                                                     |
      | Calculator_1 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_2 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_3 | Please wait. You will return to your device's home screen in a few seconds. |
      | Calculator_4 | Please wait. You will return to your device's home screen in a few seconds. |

    #--------------- QuickDelete options
  @Smoke @QuickDelete @Automated @E2E #en local funciona, en bs no. (hace swipe a la pantalla en vez de al boton)
  Scenario: Security - Quick delete - Delete files - delete the Audio files
    Given the user records an audio file
    When toggle the switch on the "Quick delete" option
    And select check box Delete files
    And Go to the Tella homepage from Security Page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message Quick Delete mode activation
    And the app is closed
    And open Tella application again
    And set security code valid
    Then that files were deleted

  @Smoke @QuickDelete @ToBeAutomated @E2E
  Scenario: Security - Quick delete - Delete draft and submitted forms from server
    Given The user has already connected to the Tella web server
    And the user has forms written and submitted
    When toggle the switch on the "Quick delete" option
    And Go to the Tella homepage from Security Page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message Quick Delete mode activation
    And the app is closed
    And open Tella application again
    And set security code valid
    And the user remains connected to the Tella web server
    Then no available forms are displayed

  @Smoke @QuickDelete @Automated @E2E
  Scenario: Security - Quick delete - Delete connection to the server
    Given The user has already connected to the Tella web server
    When toggle the switch on the "Quick delete" option
    And Go to the Tella homepage from Security Page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message Quick Delete mode activation
    And the app is closed
    And open Tella application again
    And set security code valid
    Then The user is no longer connected to the Tella web server.

  @Smoke @QuickDelete @Automated @Flow
  Scenario: Security - Quick delete - Verify slide Delete
    When toggle the switch on the "Quick delete" option
    And Go to the Tella homepage from Security Page
    Then verify slide "DELETE" button is present

  @QuickDelete @HelpInfo @Automated
  Scenario Outline: Security - Quick delete - Help info
    When toggle the switch on the "Quick delete" option
    And click on the help icon in <deleteOption>
    Then the help info message <message> is displayed

    Examples:
      | deleteOption                     | message                                                                |
      | Delete files                     | Delete all the files stored in Tella.                                  |
      | Delete draft and submitted forms | Delete all draft and submitted forms.                                  |
      | Delete server settings           | Delete your connections to servers and all forms associated with them. |

  @Smoke @Automated @Flow
  Scenario Outline: Security - <option> ON
    When toggle the switch on the "<option>" option
    Then the "<option>" option is activated

    Examples:
      | option                           |
      | Quick delete                     |
      | Preserve metadata when importing |
      | Camera silent mode               |

    #--------- General toggle

  @Smoke @ToBeAutomated @Flow
  Scenario: Security - Preserve metadata when importing
    When view "Preserve metadata when importing"
    And taps switch in ON to option "Preserve metadata when importing"
    Then the "Preserve metadata when importing" option is activated
    #okis Pending the entire e2e

  @CameraSilentMode @SmokeManual @E2E
  Scenario: Security - Camera silent mode
    When toggle the switch on the "Camera silent mode" option
    And go to Tella home page
    And taps camera button
    And take photo
    Then the camera did not make the sound

  @CameraSilentMode @SmokeManual @E2E
  Scenario: Security - Camera silent mode
    When toggle the switch on the "Camera silent mode" option
    And go to Tella home page
    And taps camera button
    And take a video
    Then the camera did not make the sound

  @Smoke @ScreenSecurity @ToBeAutomated
  Scenario: Security - Screen security
    When toggle the switch on the "Screen security" option
    And go to Tella home page
    And take screenshot
    Then view warning permissions




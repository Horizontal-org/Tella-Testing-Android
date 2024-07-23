@Security @Regression

Feature: Security

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the category Security

  @Android @Lock
  Scenario Outline: Security - Lock - password option
    When  taps "Security" option
    And taps "Lock" option in security category
    And set security code valid
    And tap "password" option
    And set <password>
    And taps "next" button
    And set confirm <password>
    And taps "next" button
    Then "Your lock has been changed" message is shown

    Examples:
      | password |
      | 1234560  |

  @Android @Lock
  Scenario Outline: Security - Lock - PIN option
    When  taps "Security" option
    And taps "Lock" option in security category
    And set security code valid
    And taps "PIN" option
    And set <PIN>
    And taps "next" button
    And set confirm <PIN>
    And taps "next" button
    Then "Your lock has been changed" message is shown

    Examples:
      | PIN     |
      | 1234560 |

  @Android @Lock
  Scenario: Security - lock - pattern option
    When  taps "Security" option
    And taps "Lock" option in security category
    And set security code valid
    And taps "pattern" option
    And set pattern
    And taps "next" button
    And set confirm pattern
    And taps "next" button
    Then  "Your lock has been changed" message is shown

  @Smoke @Android @LockTimeout
  Scenario Outline: Security - Lock Timeout
    When taps "Security" option
    And taps "Lock timeout" option in security category
    And select <timeout> option
    And taps "OK" button
    And wait <timeout> of time
    Then view screen lock

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |

  @Smoke @Android @LockTimeout @Automated
  Scenario Outline: Security - Change Lock Timeout
    When the user clicks the "Lock Timeout" option
    And select timeout <timeout> option
    And taps "OK" button
    Then the option timeout <timeout> is selected

    Examples:
      | timeout     |
      | Immediately |
      | 1 minute    |
      | 5 minutes   |
      | 30 minutes  |
      | 1 hour      |

  @Smoke @Android @DeleteAfterFailedUnlock
  Scenario Outline: Security - Delete after failed unlock
    When taps "Security" option
    And taps "Delete after failed unlock" option in security category
    And select <attempts> option
    And taps "OK" button
    And the user close the app
    And the user set incorrect <PIN> in <attempts>
    Then sees that the files have been deleted

    Examples:
      | attempts    | PIN    |
      | 5 attempts  | 123450 |
      | 10 attempts | 123451 |
      | 20 attempts | 123450 |

  @Smoke @Android @DeleteAfterFailedUnlock @Automated
  Scenario Outline: Security - Delete after failed unlock
    When the user clicks the "Delete after failed unlock" option
    And select attempts <attempts> option
    And taps "OK" button
    Then the sucessfull message <message> is displayed
    And the "Delete after failed unlock" option is changed to status <status>

    Examples:
      | attempts                 | status | message                                                         |
      | Off (do not delete data) | Off    |                                                                 |
      | 5 attempts               | On     | Your Tella data will be deleted after 5 failed unlock attempts  |
      | 10 attempts              | On     | Your Tella data will be deleted after 10 failed unlock attempts |
      | 20 attempts              | On     | Your Tella data will be deleted after 20 failed unlock attempts |

  @Smoke @Android @Camouflage
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

  @Smoke @Android @Camouflage
  Scenario Outline: Security - camouflage -  change camuflaje method - hide behind a calculator
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

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - delete file
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box "Delete files"

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - delete file
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box "Delete files"
    And go to Tella home page
    And verify slide "DELETE" button is present
    And taps slide "DELETE" button
    And view counter message "Quick Delete mode activation"
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that files were deleted

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - Delete draft and submitted forms
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box “Delete draft and submitted forms”

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - Delete draft and submitted forms
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box “Delete draft and submitted forms”
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that draft and submitted forms were deleted

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - Delete server settings
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box “Delete server settings”

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - Delete server settings
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box “Delete server settings”
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    And open Tella application again
    And set security code valid
    Then view that server settings were deleted

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - Delete Tella
    When taps "Security" option
    Then view that server settings were deleted

  @Smoke @Android @QuickDelete
  Scenario: Security - Quick delete - Delete Tella
    When taps "Security" option
    And taps switch in "Quick delete" option in security category
    And select check box “Delete Tella”
    And go to Tella home page
    And verify slide “DELETE” button is present
    And taps slide “DELETE” button
    And view counter message “Quick Delete mode activation”
    And waits finish counter
    And view closed the Tella application
    Then view uninstall message


  @Smoke @Android @QuickDelete
  Scenario Outline: Security - Quick delete - help info
    When taps "Security" option
    And taps "Quick delete" option in security category
    And taps icon help in <deleteOption>
    Then view the help info with <message>

    Examples:
      | deleteOption                     | message                                                                                                                                          |
      | Delete files                     | Delete all the files stored in Tella                                                                                                             |
      | Delete draft and submitted forms | Delete all draft and submitted forms                                                                                                             |
      | Delete server settings           | Delete your connections to servers and all forms associated with them                                                                            |
      | Delete Tella                     | Delete the app and all the data it contains. You will be asked "Do you want to uninstall this app?" Unless you confirm,Tella will not be delete. |


  @Smoke @Android @PreserveMetadata
  Scenario: Security - Preserve metadata when importing
    When taps "Security" option
    And view "Preserve metadata when importing"
    And taps switch in ON to option "Preserve metadata when importing"
    Then the "Preserve metadata when importing" option is activated

  @Smoke @Android @CameraSilentMode
  Scenario: Security - Camera silent mode
    When taps "Security" option
    And view "Camera silent mode"
    And taps switch in ON to option "Camera silent mode"
    And go to Tella home page
    And taps camera button
    And take photo
    Then the camera did not make the sound

  @Smoke @Android @ScreenSecurity
  Scenario: Security - Screen security
    When taps "security" option
    And view "Screen security"
    And taps switch in ON to option "Screen security"
    And go to Tella home page
    And take screenshot
    Then view warning permissions

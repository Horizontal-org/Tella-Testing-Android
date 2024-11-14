@Regression @DropBox @Servers @IOS
Feature: DropBox
    #CANNOT BE RUN VIA BROWSER STACK

  Background:
    Given the user is in Tella home page
    And the user is connected to the "DropBox" server


  @Smoke @SmokeManual
  Scenario Outline: Submit report with <Select files>
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects files option "<Select files>"
    And optional selects files and presses the "verification" icon
    And the user presses "SUBMIT" button
    Then the form will be visible in the submitted section

    Examples:
      | Select files            |
      | Take photo with camera  |
      | Take video with camera  |
      | Record audio            |
      | Select from Tella files |
      | Select from your device |


  @Smoke @SmokeManual
  Scenario: Delete report during sending
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And selects files and presses the "verification" icon
    And the user presses "SUBMIT" button
    And sees the file being uploaded and presses Pause
    And goes back
    And presses Outbox
    And presses the "Menu" icon of a Outbox report
    And selects Delete
    And confirms the Delete option
    Then the message "filename has been deleted" is displayed

  @Smoke @SmokeManual
  Scenario: Save report to draft without leaving the "New report" screen
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And not completes the Title and the Description
    Then the save, clock and send options will not be available


    #Draft Reports
  @Smoke @SmokeManual
  Scenario Outline: Save report to draft without leaving the "New report" screen
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And selects files and presses the "verification" icon
    And presses <option> icon
    Then the approval message <message> appears
    And the user will be able to continue editing the report

    Examples:
      | option | message                         |
      | Save   | The report was saved as a draft |

  @Smoke @SmokeManual
  Scenario Outline: Save report to draft without leaving the "New report" screen
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user presses the back button
    Then a warning sign will appear
    And the user will be able to choose between the options <Options>

    Examples:
      | Options       |
      | Exit Anyway   |
      | Save and Exit |

  @Smoke @SmokeManual
  Scenario: Delete form from Draft
    Given the user has an form in Draft
    When the user selects is in the category Draft
    And the user taps the "⁝" button
    And selects Delete
    And confirms the Delete option
    Then the approval message "The 'name form' was deleted" appears


    #Outbox
  @Smoke @SmokeManual
  Scenario: Send a report from Outbox
    And the user has a report in the Outbox folder
    When the user taps the "DropBox" connection
    And selects the option Outbox
    And the user taps the "⁝" button
    And selects View
    And taps Resume
    Then the form will be visible in the submitted section

  @Smoke @SmokeManual
  Scenario Outline: Pause a report while sending
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects files option "<Select file>"
    And the user presses "SUBMIT" button
    And the user presses "PAUSE" button
    Then the form will be visible in the outbox section

    Examples:
      | Select file            |
      | Take video with camera |

  @Smoke @SmokeManual
  Scenario: Delete a report from Outbox
    And the user has a report in the Outbox folder
    When the user taps the "DropBox" connection
    And selects the option Outbox
    And the user taps the "⁝" button
    And selects Delete
    And the user presses confirm Delete button
    Then the sucessfull message "your file has been deleted" appears

  @Smoke @SmokeManual
  Scenario Outline: Save report to Outbox
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And selects files and presses the "verification" icon
    And presses <option> icon
    Then the approval message <message> appears

    Examples:
      | option | message                                                               |
      | Clock  | The report was saved to your Outbox. You can submit it when you ready |

  @Smoke @SmokeManual
  Scenario: Send a report while the internet is desconnecting
    When the user taps the "DropBox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And selects files option "Take photo with camera"
    And the user presses the button for take a photo
    And the user presses "SUBMIT" button
    And disconnect internet from your cell phone
    Then the report will not be uploaded but will be available in OutBox

    
  #Submitted Reports
  @Smoke @SmokeManual
  Scenario: View a report from Submitted
    And the user has a report in the Submitted folder
    When the user taps the "DropBox" connection
    And selects the option Submitted
    And the user taps the "⁝" button
    And selects View
    Then the details from the form will be visible

  @Smoke @SmokeManual
  Scenario: Delete a report from Submitted
    And the user has a report in the Submitted folder
    When the user taps the "DropBox" connection
    And selects the option Submitted
    And the user taps the "⁝" button
    And selects Delete
    Then the form will be deleted from the submitted section
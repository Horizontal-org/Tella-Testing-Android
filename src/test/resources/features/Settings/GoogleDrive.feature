@Regression @GoogleDrive @Servers

Feature: Google Drive
  #CANNOT BE RUN VIA BROWSER STACK

  Background:
    Given the user is in Tella home page
    And the user is connected to the Google drive server



  @Smoke @SmokeManual
  Scenario: Submit new report with photo
    When the user taps the "Google Drive" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And selects files option "Take photo with camera"
    And the user presses the button for take a photo
    And the user presses "SUBMIT" button
    Then the sucessfull message "Your report is available in the Outbox" appears


  @Smoke @@SmokeManual
  Scenario Outline: Submit new report with <Recording>
    When the user taps the "Google Drive" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence <Recording>"
    And the user taps + button for the attach files
    And selects files option "<Select files>"
    And press the record icon and then press stop
    And the user presses "SUBMIT" button
    Then the sucessfull message "Your report is available in the Outbox" appears

    Examples:
      | Recording | Select files           |
      | video     | Take photo with camera |
      | audio     | Record audio           |


  @Smoke @SmokeManual
  Scenario Outline: Submit new report with <Select files>
    When the user taps the "Google Drive" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects files option "<Select files>"
    And optional selects files and presses the "verification" icon
    And the user presses "SUBMIT" button
    Then the sucessfull message "Your report is available in the Outbox" appears

    Examples:
      | Select files            |
      | Select from Tella files |
      | Select from your device |


  @Smoke @SmokeManual
  Scenario: Delete report during sending
    When the user taps the "Reports" connection
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
    Then the sucessfull message "File has been deleted" appears


  @Smoke @SmokeManual
  Scenario Outline: Save report to <option>
    When the user taps the "GoogleDrive" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And selects files and presses the "verification" icon
    And presses <option> icon
    Then the approval message <message> appears

    Examples:
      | option | message                                                               |
      | Save   | The report was saved as a draft                                       |
      | Clock  | The report was saved to your Outbox. You can submit it when you ready |


  @Smoke @SmokeManual
  Scenario: Send a report from Outbox
    And the user has a report in the Outbox folder
    When the user taps the "Google Drive" connection
    And selects the option Outbox
    And the user taps the "⁝" button
    And selects View
    And taps Submit
    Then the sucessfull message "Your report is available in the Outbox" appears

  @Smoke @SmokeManual
  Scenario: Send a report with video while the internet is desconnecting
    When the user taps the "Google Drive" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And selects files option "Take photo with camera"
    And the user presses the button for take a photo
    And the user presses "SUBMIT" button
    And disconnect internet from your cell phone
    Then the report will not be uploaded but will be available in OutBox

  @Smoke @SmokeManual
  Scenario: Save forms to Draft
    When the user taps the "Google Drive" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And presses "Save" icon
    Then the approval message "The report was saved as a draft" appears
    And the form is saved on the Draft

  @Smoke @SmokeManual
  Scenario: Delete form from Draft
    Given the user has an form in Draft
    When the user selects is in the category Draft
    And the user taps the "⁝" button
    And selects Delete
    And confirms the Delete option
    Then the approval message "The form was deleted" appears

@Regression @NextCloud @Servers
Feature: NextCloud
  #CANNOT BE RUN VIA BROWSER STACK

  Background:
    Given the user is in Tella home page
    And the user is connected to the "NextCloud" server


  @Smoke @SmokeManual
  Scenario Outline: Submit report with <Select files>
    When the user taps the "NextCloud" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And selects files option "<Select files>"
    And  optional selects files and presses the "verification" icon
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
    When the user taps the "NextCloud" connection
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
    Then the approval message "filename has been deleted" appears


  @Smoke @SmokeManual
  Scenario Outline: Save report to <option>
    When the user taps the "NextCloud" connection
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
    When the user taps the "NextCloud" connection
    And selects the option Outbox
    And the user taps the "⁝" button
    And selects View
    And taps Resume
    Then the form will be visible in the submitted section


  @Smoke @SmokeManual
  Scenario: Send a report while the internet is desconnecting
    When the user taps the "NextCloud" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And selects files option "Take photo with camera"
    And the user presses the button for take a photo
    And the user presses "SUBMIT" button
    And disconnect internet from your cell phone
    Then the report will not be uploaded but will be available in OutBox

  @Smoke @ToBeAutomated
  Scenario: Save forms to Draft
    When the user taps the "NextCloud" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And presses "Save" icon
    Then the approval message "The report was saved as a draft" appears
    And the form is saved on the Draft

  @Smoke @ToBeAutomated
  Scenario: Delete form from Draft
    Given the user has an form in Draft
    When the user selects is in the category Draft
    And the user taps the "⁝" button
    And selects Delete
    And confirms the Delete option
    Then the approval message "The "name form" was deleted" appears

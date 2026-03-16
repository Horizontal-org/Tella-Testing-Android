@Regression @Dropbox @Servers
Feature: Dropbox

  Background:
    Given the user is in Tella home page
    And the user is connected to the "Dropbox" server
    
     @Smoke @SmokeManual
  Scenario Outline: Submit report with <Select files>
    When the user taps the "Dropbox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence photo"
    And the user taps + button for the attach files
    And selects files option "<Select files>"
    And The user selects the file and taps the 'Verification' icon
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
    When the user taps the "Dropbox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And The user selects the file and taps the 'Verification' icon
    And the user presses "SUBMIT" button
    And the user sees the file being uploaded and presses "PAUSE"
    And the user taps "REPORT"
    And the user taps Outbox
    And the user presses the "Menu" icon of a Outbox report
    And the user selects "Delete"
    And the user confirms the Delete option
    Then the approval message "filename has been deleted" appears
    
 @Smoke @SmokeManual
  Scenario Outline: Save report to <option>
    When the user taps the "Dropboxd" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And The user selects the file and taps the 'Verification' icon
    And the user presses <option> icon
    Then the approval message <message> appears
    
   Examples:
      | option | message                                                               |
      | Save   | The report was saved as a draft                                       |
      | Clock  | The report was saved to your Outbox. You can submit it when you ready |
      
  @Smoke @SmokeManual
  Scenario: Send a report from Outbox
    And the user has a report in the Outbox folder
    When the user taps the "Dropbox" connection
    And selects the option Outbox
    And the user taps the "⁝" button
    And the user taps "View"
    And the user taps "RESUME"
    Then the form will be visible in the submitted section
    

    
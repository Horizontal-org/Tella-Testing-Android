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
    When the user taps the "Dropbox" connection
    And the user presses "NEW REPORT" button
    And completes the Title "Crowdar" and the Description "Evidence"
    And the user taps + button for the attach files
    And selects the option Select from Tella files
    And selects files and presses the "verification" icon
    And the user presses "SUBMIT" button
    And sees the file being uploaded and presses "Pause"
    And the user selects goes back
    And the user taps presses Outbox
    And presses the "Menu" icon of a Outbox report
    And the user selects Delete
    And the user confirms the Delete option
    Then the approval message "filename has been deleted" appears
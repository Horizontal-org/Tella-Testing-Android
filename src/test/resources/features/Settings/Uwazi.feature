@Uwazi 
Feature: Uwazi
  
  Background: 
    Given the user is authenticated in the Tella application with valid credentials
    And the user is in Tella home page
    And the user is connected to the Uwazi server
  
  @Smoke  
  Scenario: Download templates 
    When the user taps on the "Uwazi" connection
    And presses the "Add" icon
    And presses the Download button in the download template
    Then a green checkmark appears next to the download template
    And the template is now on the Uwazi templates list, ready for the user to fill out
  
  @Smoke
  Scenario: Submit entity without attachments
    When the user taps on the "Uwazi" connection
    

  @Smoke
  Scenario: Submit entity with only primary document
    


@NoCandidate
Scenario Outline: Submit new report with <recording>
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option <Select files>
And presses the "rec" and "stop" icon
And taps Submit 
And sees the file being uploaded
Then the approval message "your report is available Outbox" 
    
  @Smoke
  Scenario: Submit entity with both primary document and supporting documentation
  
  @Smoke
  Scenario: Submit entities without authentication
    
  @Smoke
  Scenario: Submit entity with only supporting documentation
    
  @Smoke
  Scenario: Submit entity with large attachments while connected to internet, disconect/reconect internet several times
    
  @Smoke
  Scenario: Save entity to Outbox
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes the title
    And completes all the required fields
    And presses "Next"
    And presses "Submit later"
    Then the entity is saved on the Outbox tab

  @Smoke
  Scenario: Save entity as Draft
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes the title
    And presses the "Save" icon
    Then the entity is saved on the Draft tab
    And the message: "Entity is saved as draft" appears
    
  @Smoke #No se puede unificar con tellaweb
  Scenario Outline: Delete entity from <Category>
    Given the user has an entity in <Category>
    When the user taps on the "Uwazi" connection
    And the user selects the category <Category>
    And the user taps the "⁝" button
    And selects Delete 
    And confirms the Delete option
    Then the entity is deleted
    
    Examples: 
      | Category       |
      | Outbox         |
      | Submitted      |
      | Draft          |


  @ToBeAutomated
Scenario: Delete report during sending
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses the "Add" icon
And selects the option Select from Tella files
And select files and presses the "verification" icon
And taps Submit 
And sees the file being uploaded and presses Pause
And go back 
And presses Outbox
And presses "Menu" icon
And select Delete and confirms the Delete option
Then the approval message "File has been delete
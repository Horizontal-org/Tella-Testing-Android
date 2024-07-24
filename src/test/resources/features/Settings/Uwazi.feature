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
    
  @Smoke
  Scenario: Submit entity with both primary document and supporting documentation
  
  @Smoke
  Scenario: Submit entities without authentication
    
  @Smoke
  Scenario: Submit entity with only supporting documentation
    
  @Smoke
  Scenario: Submit entity with large attachments while connected to internet, disconect/reconect internet several times
    
  @Smoke
  Scenario: Save entity as draft
    
    
@ToBeAutomated
Scenario: Save report to Draft and send later
When the user taps the Report 
And taps the New report
And completes the Title and the Description
And presses "Save" icon
And the approval message "The report was saved as a draft"
And presses the cross
And presses "Menu" icon
And select Edit draft
And presses the "Add" icon
And selects the option Select from Tella files
And select files and presses the "verification" icon
And taps Send
Then the approval message "your report is available Outbox" 
  
  @Smoke
  Scenario: Save entity to outbox
    
  @Smoke #No se puede unificar con tellaweb
  Scenario Outline: Delete entity in <Option Report>
    Given the user has an entity in outbox
    When the user selects the option <Option Report>
    And the user taps the "⁝" button
    And selects Delete 
    And confirms the Delete option
    Then the entity is deleted
    
    Examples: 
      | Option Report  |
      | Outbox         |
      | Submitted      |

  @Smoke 
  Scenario: Delete sent entity
    
  @Smoke
  Scenario: Delete draft entity
    
    
@ToBeAutomated
Scenario Outline: Delete draft
When the user taps the Report 
And select file
And presses "Menu" icon
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"
  
    
    
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
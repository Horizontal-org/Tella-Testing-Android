Feature: Common Server
  
  @Smoke
  Scenario Outline: Delete entity in <Option Report> with <server>
    Given the user has an entity in outbox
    When the user selects the option <Option Report>
    And the user taps the "⁝" button 
    
    Examples: 
      | Option Report | server      |       
    
@ToBeAutomated
Scenario Outline: Delete <Option Report>
When the user taps the Report 
And selects the option <Option Report>
And select file
And presses "Menu" icon
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"
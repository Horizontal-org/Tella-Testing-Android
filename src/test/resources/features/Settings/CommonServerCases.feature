Feature: Common Server
  
  @Smoke
  Scenario Outline: Delete entity in <Option Report> with <server>
    Given the user has <data> in outbox
    When the user selects the option <Option Report>
    And the user taps the "⁝" button
    And selects Delete 
    And confirms the Delete option
    Then the approval message "File has been deleted"    
    
    Examples: 
      | server    | Option Report  | data       |
      | Tella Web | Outbox         | a form     |
      | Tella Web | Submitted      | a form     |
      | Uwazi     | Outbox         | an entity  |
      | Uwazi     | Submitted      | an entity  |
    
    
@ToBeAutomated
Scenario Outline: Delete <Option Report>
When the user taps the Report 
And selects the option <Option Report>
And select file
And presses "Menu" icon
And select Delete and confirms the Delete option
Then the approval message "File has been deleted"
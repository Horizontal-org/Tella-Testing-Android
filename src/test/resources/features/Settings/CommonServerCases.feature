@TellaWeb  @ODK
Feature: Common Server
  
  Background:
  Given the user is authenticated in the Tella application with valid credentials
	And the user is in Tella home page
  And the user is connected to the servers.
  
  
  @Smoke
  Scenario Outline: Delete <File> from <Category>
    Given the user has an <File> in <Category>
    When the user taps on the <Conecction> connection
    And the user selects the category <Category>
    And the user taps the "⁝" button
    And selects Delete 
    And confirms the Delete option
    Then the approval message "File has been deleted" appears
    
    @ODK
    Examples: 
      |File   | Category       |Conecction|
      |Form   | Submitted      |ODK       |
      |Form   | Outbox         |ODK       |
    @TellaWeb
    Examples: 
      |File   | Category       |Conecction|
      |Reports| Submitted      |Tella Web |    
      |Reports| Outbox         |Tella Web |
      
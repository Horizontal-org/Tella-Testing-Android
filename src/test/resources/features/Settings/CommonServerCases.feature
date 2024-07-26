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
    Then the file is deleted
    
    Examples: 
      |File   | Category       |Conecction|
      |Entity | Outbox         |Uwazi     |
      |Form   | Submitted      |ODK       |
      |Reports| Draft          |Tella Web |
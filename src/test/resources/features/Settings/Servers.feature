  @Servers @Smoke @Regression
  Feature: Servers
  
  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the category Servers
  
  Scenario: View Settings in the Server Category
    When the user presses the + button
    Then the user views the server configurations

  @Automated
  Scenario: Servers - View Server Options
    When the user presses the + button
    Then the user sees all possible server options available for connection
  
  Scenario Outline: Select Server
    When the user presses the + button
    And selects the server <server>
    And presses "Ok"
    Then the user sees the chosen server with the corresponding configurations for establishing the connection
    
    Examples:
      | server             |
      | Open Data Kit (ODK)|
      | Tella Web          |
      | Uwazi              |
	
  Scenario: Configure Open Data Kit Server
    When the user presses the + button
    And selects the "Open Data Kit" option
    And presses "Ok"
    Then the user views the server settings with fields "server name"; "server URL" to fill
    And presses "Save" to save the configuration

  Scenario: Configure Advanced Open Data Kit Server
    When the user presses the + button
    And selects the "Open Data Kit" option
    And presses "Ok"
    And the user views the server settings with fields "server name"; "server URL" to fill
    And expands the "advanced" section
    Then the user views the fields "user name"; "password" to fill
    And presses "Save" to save the configuration

  Scenario Outline: Configure <server> whit URL Server
    When the user presses the + button
    And the user selects the <sever> option
    And presses "Ok"
    Then the user views the server settings with the field "enter project URL" to fill
    
    Examples:
      | server    |
      | Tella Web |
      | Uwazi     |

  @TellaWeb
  Scenario Outline: Access Login for Project Access
    When the user presses the + button
    And the user selects the <server> option
    And presses "Ok"
    And the user views the server settings with the field "enter project URL" to fill
    And the user enters the project URL
    And presses "Next"
    Then the user views the login to access the project with fields "username"; "password"
    
    Examples:
      | server   |
      | Tella Web|
      | Uwazi    |
       
  Scenario Outline: Public Access with Uwazi in <language>
    When the user presses the + button
    And the user selects "Uwazi"
    And presses "Ok"
    And the user enters the project URL
    And presses "Next"
    And selects the "Public access" option
    And presses "Next"
    And the user selects the language <language>
    And presses "Next"
    Then the message "You hace successfully connected to the server and will be able to share your data." appears
    And the user is now connected to Uwazi server in <language>
    
    Examples:
      | language    |
      | English     |
      | Spanish     |
      | French      |
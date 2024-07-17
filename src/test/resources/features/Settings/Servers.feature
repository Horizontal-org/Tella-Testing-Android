  @Servers @Smoke
  Feature: Servers
  
  Background
  Given the user is authenticated in the Tella application with valid credentials 654321
	And the user is in Tella home page
  
  
  Scenario: View Settings in the Server Category
  When the user taps the settings icon
  And selects the "Servers" option
  Then the user views the server configurations
  
  
  Scenario: View Server Options
  When the user taps the settings icon
  And selects the "Servers" option
  And presses the "Add" icon
  Then the user sees all possible server options available for connection
  
  
  Scenario Outline: Select Server
  When the user taps the settings icon
  And selects the "Servers" option
  And presses the "Add" icon
  And selects the server <server>
  And press OK
  Then the user sees the chosen server with the corresponding configurations for establishing the connection
 
  Examples:
	|server             |
	|Open_Data_Kit_(ODK)|
	|Tella_Web          |
	|Uwazi              |
	
	
  Scenario: Configure Open Data Kit Server
  When the user taps the settings icon
  And selects the "Servers" option
  And presses the "Add" icon
  And selects the "Open Data Kit" option
  And taps the "OK" button
  Then the user views the server settings with fields "server name"; "server URL" to fill
  And presses "save" to save the configuration

  
  Scenario: Configure Advanced Open Data Kit Server
  When the user taps the settings icon
  And selects the "Servers" option
  And presses the "Add" icon
  And selects the "Open Data Kit" option
  And taps the "OK" button
  And the user views the server settings with fields "server name"; "server URL" to fill
  And expands the "advanced" section
  Then the user views the fields "user name"; "password" to fill
  And presses "save" to save the configuration

  
  Scenario Outline: Configure whit URL Server
  When the user taps the settings icon
  And selects the "Servers" option
  And presses the "Add" icon
  And the user selects the <sever> option
  And taps the "OK" button
  Then the user views the server settings with the field "enter project URL" to fill
  
  Examples:
  |server    |
  |Tella Web|
  |Uwazi    |

  
  Scenario Outline: Access Login for Project Access
  When the user taps the settings icon
  And selects the "Servers" option
  And presses the "add" icon
  And the user selects the <server> option
  And taps the "OK" button
  And the user views the server settings with the field "enter project URL" to fill
  And the user enters the project URL
  And presses Next
  Then the user views the login to access the project with fields "username"; "password"

  Examples:
  |server    |
  |Tella Web|
  |Uwazi    |
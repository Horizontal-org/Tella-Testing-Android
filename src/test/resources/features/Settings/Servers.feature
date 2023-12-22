  @Servers
  Feature: Servers
  
  Background
  Given the user is authenticated in the Tella application with valid credentials 654321
	And the user is in Tella home page
  
  @smoke
  Scenario: View Settings in the Server Category
  When the user taps the settings icon
  And selects the option "Servers"
  Then the user views the server configurations
  
  @smoke
  Scenario: View Server Options
 
  When the user taps the settings icon
  And selects the option "Servers"
  And presses the "Add" icon
  Then the user sees all possible server options available for connection
  
  @smoke
  Scenario Outline: Select Server
  When the user taps the settings icon
  And selects the option "Servers"
  And presses the "Add" icon
  And selects the server <server>
  And press OK
  Then the user sees the chosen server with the corresponding configurations for establishing the connection
 
  Examples:
	|server             |
	|Open_Data_Kit_(ODK)|
	|Tella_Web          |
	|Uwazi              |
	
	@smoke
  Scenario: Configure Open Data Kit Server
  Given the user is logged in Tella with valid credentials 654321
  And taps the wheel icon to access settings
  And taps the "Servers" option
  And presses the "add" icon
  When the user selects the "Open Data Kit" option
  And taps the "OK" button
  Then the user views the server settings with fields "server name"; "server URL" to fill
  And presses "save" to save the configuration

  @smoke
  Scenario: Configure Advanced Open Data Kit Server
  Given the user is logged in Tella with valid credentials 654321
  And taps the wheel icon to access settings
  And taps the "Servers" option
  And presses the "add" icon
  When the user selects the "Open Data Kit" option
  And taps the "OK" button
  And the user views the server settings with fields "server name"; "server URL" to fill
  And expands the "advanced" section
  Then the user views the fields "user name"; "password" to fill
  And presses "save" to save the configuration

  @smoke
  Scenario: Configure whit URL Server
  Given the user is logged in Tella with valid credentials 654321
  And taps the wheel icon to access settings
  And taps the "Servers" option
  And presses the "add" icon
  When the user selects the <sever> option
  And taps the "OK" button
  Then the user views the server settings with the field "enter project URL" to fill
  
  Examples:
  |server    |
  |Tella Web|
  |Uwazi    |

  @smoke
  Scenario: Access Login for Project Access
  Given the user is logged in Tella with valid credentials 654321
  And taps the wheel icon to access settings
  And taps the "Servers" option
  And presses the "add" icon
  And the user selects the <server>  option
  And taps the "OK" button
  And the user views the server settings with the field "enter project URL" to fill
  When the user enters the project URL
  And presses Next
  Then the user views the login to access the project with fields "username"; "password"

  Examples:
  |server    |
  |Tella Web|
  |Uwazi    |
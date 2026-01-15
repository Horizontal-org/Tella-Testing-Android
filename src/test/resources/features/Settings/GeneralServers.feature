@Regression @Servers @Connections
Feature: Connections - Connection to servers

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the option Servers

  @Smoke @ToBeAutomated @ViewServers @Flow
  Scenario Outline: <Servers>  - View Server Options
    When the user presses the + button
    Then the user sees all possible <Servers> options available for connection
    Examples:
      | Servers             |
      | Open Data Kit (ODK) |
      | Tella Web           |
      | Uwazi               |
      | Google drive        |
      | Dropbox             |
      | NextCloud           |

   @SmokeManual @DeleteServer @E2E
  Scenario Outline: <Servers> - Delete Server
    And the user is connected to the server <Servers>
    And the user is on the Connections screen
    When the user presses elipisis button
    And the user clicks the "Delete" option
    And the user clicks the "Delete" option
    Then the server will no longer be available in the connections view
    And the server will no longer be available in the connections view of tella's home
    Examples:
      | Servers             |
      | Open Data Kit (ODK) |
      | Tella Web           |
      | Uwazi               |
      | Google drive        |
      | Dropbox             |
      | NextCloud           |

  @SmokeManual @EditServer
  Scenario Outline: <Servers> - Edit Server
    And the user is connected to the server <Servers>
    And the user is on the Connections screen
    When the user presses elipisis button
    And the user clicks the "Edit" option
    #fill no me acuerdo cuales eran los que tenian el edit disponible okis
    Then the changes are applied to the server
    Examples:
      | Servers             |
      | Open Data Kit (ODK) |
      | Tella Web           |
      | Uwazi               |
      | Google drive        |
      | Dropbox             |
      | NextCloud           |

  @Smoke @Automated @ODK @E2E
  Scenario Outline: Servers - ODK Server
    When the user presses the + button
    And selects the server "Open Data Kit (ODK)"
    And the user presses "OK" button
    And enter the sever name <serverName>
    And enter the server url "<serverUrl>"
    And the user presses "SAVE" button
    And the user views the message <message>
    Then the user views the Server in the connect list

    Examples:
      | serverName     | serverUrl                                      | message        |
      | Server Crowdar | https://kc.kobotoolbox.org/tella_internal_test | Server created |

  @ODK @ToBeAutomated @E2E
  Scenario: Servers - Advanced Configuration in Open Data Kit Server
    And the user presses the + button
    And selects the server "Open Data Kit (ODK)"
    And the user presses "OK" button
    And expands the "Advanced" section
    When the user fills the fields "Username" and "Password"
    And the user presses "OK" button
    Then the user views the Server in the connect list

  @Smoke @Automated @TellaWeb @E2E
  Scenario: Server - Tella Web configuration with URL
    When the user presses the + button
    And selects the server "Tella Web"
    And the user presses "OK" button
    And enter the server url "https://tella.world/p/server-project-crowdar"
    And the user presses "Next" button
    And the user views the "Log in to access the project"
    And the user fills the fields "Username" and "Password"
    And the user presses "OK" button
    Then the user views the Server in the connect list

  @Smoke @Automated @Uwazi @E2E
  Scenario Outline: Public Access with Uwazi in <language>
    When the user presses the + button
    And selects the server "Uwazi"
    And the user presses "OK" button
    And enter the server url "https://horizontal.uwazi.io"
    And the user presses "Next" button
    And selects the "Public access" button
    And the user presses "Next" button
    And the user selects the language <language>
    And the user presses "Next" button
    And the user view the message "You have successfully connected to the server and will be able to share your data."
    And the user is now connected to Uwazi server in <language>
    Then the user views the Server in the connect list

    Examples:
      | language |
      | English  |
      | Spanish  |
      | French   |

  @Smoke @Automated @Uwazi @E2E
  Scenario Outline: LogIn Access with Uwazi in <language>
    When the user presses the + button
    And selects the server "Uwazi"
    And the user presses "OK" button
    And enter the server url "https://horizontal.uwazi.io"
    And the user presses "Next" button
    And selects the "Log in" button
    And the user presses "Next" button
    And the user fills the fields "Username" and "Password"
    And selects the "Log in" button
    And the user selects the language <language>
    And the user presses "Next" button
    And the user view the message "You have successfully connected to the server and will be able to share your data."
    And the user is now connected to Uwazi server in <language>
    Then the user views the Server in the connect list

    Examples:
      | language |
      | English  |
      | Spanish  |
      | French   |

  @SmokeManual @GoogleDrive @E2E
  Scenario: Server - Google Drive - Use shared drive option
    When the user presses the + button
    And selects the server "Google drive"
    And the user chooses the Google account
    And chooses the "use shared drive" option
    And the user presses "Next" button
    And the user chooses an existing folder from their drive
    And the user view the message "You have successfully connected to the server and will be able to share your data."
    And the user presses the button Go to google Drive
    Then the user views the Server in the connect list

  @SmokeManual @GoogleDrive @E2E
  Scenario: Server - Google Drive - Create new folder option
    When the user presses the + button
    And selects the server "Google drive"
    And the user chooses the Google account
    And chooses the "use shared drive" option
    And the user presses "Next" button
    And the user chooses Create new folder
    And the user name the folder "Test"
    And the user view the message "You have successfully connected to the server and will be able to share your data."
    And the user presses the button Go to google Drive
    Then the user views the Server in the connect list



    #oki hacer casos especificos para dropbox y next cloud


@Regression @Servers
Feature: Servers

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And clicks on the option Servers

  @Smoke @ToBeAutomated @ViewServers
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


  @Smoke @Automated @SelectServers
  Scenario Outline: Server - Select Server <server>
    When the user presses the + button
    And selects the server "<server>"
    And the user presses OK button
    Then the user views the server <server> settix ngs

    Examples:
      | server              |
      | Open Data Kit (ODK) |
      | Tella Web           |
      | Uwazi               |
      | Google drive        |
      | Dropbox             |
      | Nextcloud           |


  @Smoke @Automated @ODKConfig
  Scenario Outline: Servers - ODK Server Configuration
    When the user presses the + button
    And selects the server "Open Data Kit (ODK)"
    And the user presses "OK" button
    And enter the sever name <serverName>
    And enter the server url "<serverUrl>"
    And the user presses "SAVE" button
    Then the user views the message <message>
    And the user views the <serverName> in the connect list

    Examples:
      | serverName     | serverUrl                                      | message        |
      | Server Crowdar | https://kc.kobotoolbox.org/tella_internal_test | Server created |

  @Smoke @ODKConfig @ToBeAutomated
  Scenario: Servers - Advanced Configuration in Open Data Kit Server
    When the user presses the + button
    And selects the server "Open Data Kit (ODK)"
    And the user presses "OK" button
    And expands the "Advanced" section
    Then the user views the fields "Username"; "Password" to fill

  @Smoke @Automated @TellaWebConfig
  Scenario: Server - Tella Web configuration with URL
    When the user presses the + button
    And selects the server "Tella Web"
    And the user presses "OK" button
    And enter the server url "https://tella.world/p/server-project-crowdar"
    And the user presses "Next" button
    Then the user views the "Log in to access the project"
    And the user views the fields "Username" and "Password"

  @Smoke @Automated @UwaziConfig
  Scenario: Server - Uwazi configuration with URL
    When the user presses the + button
    And selects the server "Uwazi"
    And the user presses "OK" button
    And enter the server url "https://horizontal.uwazi.io"
    And the user presses "Next" button
    Then the user views the buttons:
      | Log in        |
      | Public access |

  @Smoke @Automated @UwaziConfigLanguage
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
    Then the user view the message "You have successfully connected to the server and will be able to share your data."
    And the user is now connected to Uwazi server in <language>

    Examples:
      | language |
      | English  |
      | Spanish  |
      | French   |


  @Smoke @SmokeManual @GoogleDrive
  Scenario Outline: Server - Google Drive
    When the user presses the + button
    And selects the server "Google drive"
    And the user presses the "Next" button
    And the user accepts the permissions
    And the user chooses the Google account
    And accepts the permissions
    And chooses the <options> option
    And creates a new folder and names it
    And the user presses the "Next" button
    Then the user sees the message "You have successfully connected to the server and will be able to share your data."

    Examples:
      | options            |
      | use shared drive   |
      | use personal drive |






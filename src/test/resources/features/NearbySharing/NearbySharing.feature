@NearbySharing

Feature: NearbySharing

  @Smoke @Connections
  Scenario: Nearby sharing button is visible on the Homescreen
    Given the user is in Tella home page
    When the "Connections" section is displayed
    Then the "Nearby sharing" button is visible inside the "Connections" section


  @Smoke @ToBeAutomated
  Scenario: NearbySharing - SEND FILES
    Given the user presses "NearbySharing" button
    When the user taps "SEND FILES" button
    And the user presses "Next" button
    Then the "Wi-Fi" screen is displayed

    @WifiScreen
  Scenario: Wi-Fi screen - checking confirmation enables Next
    Given the "Wi-Fi" screen is displayed
    When the user taps the checkbox "Yes, we are on the same Wi-Fi network"
    Then the checkbox "Yes, we are on the same Wi-Fi network" is checked
    And the "Next" button is enabled

  @WifiScreen
  Scenario: Wi-Fi screen - default state with connection - check button disabled
    Given the "Wi-Fi" screen is displayed
    And the section "Tips to connect" is visible
    And the row "Current WiFi network" shows a network name
    And the checkbox "Yes, we are on the same Wi-Fi network" is visible and unchecked and enabled
    And the "Next" button remains disabled

  @WifiScreen
  Scenario: Wi-Fi screen - No wifi conection device
    Given the "Wi-Fi" screen is displayed
    And the device is NOT connected to a Wi-Fi network
    Then the row "Current WiFi network" shows "No connection"
    And the checkbox "Yes, we are on the same Wi-Fi network" is disabled
    And the "Next" button remains disabled

  @WifiScreen
#revisar si este caso funcionaria de este modo
  Scenario: Wi-Fi screen - location permission banner
    Given the "Wi-Fi" screen is displayed
    And Location permission is disabled for the app
    Then the text "Location access" is displayed
    And the message "To detect the Wi-Fi network, please enable location access in your device Settings." is displayed
    And the "CANCEL" and "SETTINGS" buttons are visible




@QRScreen
  Scenario: QR screen - scanner and manual entry
    Given the "Connect to device" screen is displayed
    And the QR scanner view is visible
    And the "CONNECT MANUALLY" button is enabled

  Scenario: Manual form - inputs and Next gating
    Given the "Connect to device" screen is displayed
    When the user taps "CONNECT MANUALLY" button
    Then the "Connect manually" screen is displayed
    And the inputs "Connect code", "PIN", and "Port" are visible
    And the "Next" button remains disabled
    When the user types "23-127-8" into "Connect code"
    And the user types "391283" into "PIN"
    And the user types "443" into "Port"
    Then the "Next" button is enabled

  Scenario: Verification - UI and actions
    Given the "Connect manually" screen is displayed
    And the user has entered valid "Connect code", "PIN" and "Port"
    When the user taps "Next" button
    Then the "Verification" screen is displayed
    And the sequence hash is visible in grouped format
    And the "CONFIRM AND CONNECT" button is enabled
    And the "DISCARD AND START OVER" button is visible

  Scenario: Verification - confirm shows waiting state
    Given the "Verification" screen is displayed
    When the user taps "CONFIRM AND CONNECT" button
    Then the button shows "WAITING FOR RECIPIENT ..."
    And the "WAITING FOR RECIPIENT ..." button is disabled

  Scenario: Verification - discard returns to QR
    Given the "Verification" screen is displayed
    When the user taps "DISCARD AND START OVER" button
    Then the "Connect to device" screen is displayed
    And the QR scanner view is visible















  @Smoke @E2E @Automated
  Scenario: NearbySharing - RECEIVE FILES
    When the user taps "RECEIVE FILES" button
    And taps "Next"
    Then the "Receive files" waiting screen is displayed
    And the indicator "Waiting to receive" (or equivalent) is visible
  @LinkInfo
  Scenario: Learn more link opens info page
    When the user taps the "Learn more about nearby sharing" link
    Then an info page or webview about "Nearby sharing" is displayed
    And the user can return to the "Nearby sharing" screen

@Regression @NearbySharing

Feature: NearbySharing - Estas pruebas deben hacerse Android, ios, Tella Desktop
#No pueden automatizarse

  @Smoke @Connections @Flow
  Scenario: Nearby sharing button is visible on the Homescreen
    Given the user is in Tella home page
    When the "Connections" section is displayed
    And the "Nearby sharing" button is visible
    And the "+" button is visible
    Then the user presses "NearbySharing" button
    And the sees the "SEND FILES" and "RECEIVE FILES" button

  @Smoke @LinkInfo
  Scenario: Learn more link opens info page
    Given the user is in the nearby Sharing option
    When the user taps the "Learn more about nearby sharing" link
    Then an info page or webview about "Nearby sharing" is displayed

  @Smoke @GetConnected @WifiScreen
  Scenario: Wi-Fi screen - checking confirmation enables Next button
    Given the user is in the nearby Sharing option
    And the user presses "SEND FILES" button
    And the "Get connected" screen is displayed
    And the "Next" button is disabled
    When the devices are connected to the same Wi-Fi
    And the user taps the checkbox "Yes, we are on the same Wi-Fi network"
    Then the "Next" button is enabled

  @GetConnected @Fail @WifiScreen
  Scenario: Wi-Fi screen - No wifi connection device
    Given the "Wi-Fi" screen is displayed
    And the device is NOT connected to a Wi-Fi network
    Then the row "Current WiFi network" shows "No network connected"
    And the checkbox "Yes, we are on the same Wi-Fi network" is disabled
    And the "Next" button remains disabled

  @GetConnected @WifiScreen
  Scenario: Wi-Fi screen - location permission banner - GPS disabled
    Given the "Wi-Fi" screen is displayed
    And Location permission (GPS) is disabled for the app
    Then the text "Location access" is displayed
    And the message "To detect the Wi-Fi network, please enable location access in your device Settings." is displayed

  @GetConnected @WifiScreen
  Scenario: Wi-Fi screen - change wifi network
    Given the "Wi-Fi" screen is displayed
    And the user taps the checkbox "Yes, we are on the same Wi-Fi network"
    And the user presses "Next" button
    When the devices connect
    And the sending device changes its Wi-Fi networkthe sending device changes its Wi-Fi network
    Then the message "Your wifi connection has changed. Please start over" is displayed

  @Smoke @GetConnected @WifiScreen @Hotspot
  Scenario: Wi-Fi screen - Hotspot success connection
    Given the user activates mobile data on their device
    And the user activates the hotspot option on their device
    And the devices are connected to the same Hotspot connection
    And the user is in the nearby Sharing option
    And the "Get connected" screen is displayed
    When the user taps the checkbox "Yes, we are on the same Wi-Fi network"
    Then the devices connect successfully
    And you can send and receive files

   @GetConnected @WifiScreen @Hotspot
  Scenario: Wi-Fi screen - Hotspot fail connection - The connection fails due to a lack of mobile data
    Given the user activates mobile data on their device
    And the user activates the hotspot option on their device
    And the devices are connected to the same Hotspot connection
    And the user is in the nearby Sharing option
    And the "Get connected" screen is displayed
     #aqui aparece un cartel que no pude capturar, habla de que si no tenes credito para conectarte a internet tendras fallas
    Then the checkbox "Yes, we are on the same Wi-Fi network" is disabled

  @ConnectToDevice
  Scenario: Connect To Device - qr scanner and manual entry
    Given the "Connect to device" screen is displayed
    And the QR or QR SCANNER view is visible
    And the "CONNECT MANUALLY" button is enabled

  @Smoke @ConnectToDevice @Sender @ManualConnect @Flow
  Scenario: Manual connect - Sender device - Success connection
    Given the user is in the nearby Sharing option
    And the user presses "SEND FILES" button
    And the user presses "Next" button
    And the devices are connected to the same Wi-Fi network
    When the user taps "CONNECT MANUALLY" button
    And the "Connect manually" screen is displayed
    And the user enter valid "Connect code", "PIN" and "Port" provide from the Recipient device
    And the user taps the "Next" button
    Then the "Send files" screen is visible

  @Smoke @ConnectToDevice @Sender @QRConnect @Flow
  Scenario: QR connect - Sender device - Success connection
    Given the user is in the nearby Sharing option
    And the user presses "SEND FILES" button
    And the user presses "Next" button
    And the devices are connected to the same Wi-Fi network
    When the user views the QR scan
    And the user scans the QR code provided by the recipient device
    Then the "Send files" screen is visible

  @Smoke @ConnectToDevice @Sender @ManualConnect @E2E
  Scenario Outline: Manual connect - Sender device - Success connection from <device1> to Recipient device <device2>
    Given the user is connected to the Recipient device
    And  the "Send files" screen is visible
    When the user fills in the title and selects a file from the option
      | Import from Tella app          |
      | from the device                |
      | takes a photo/video from Tella |
      | records an audio               |
    And the files are visible
    And the user presses "Send" button
    And the sender presses the "Confirm and Connect" button
    And the message ""Waiting for the recipient to accept files"" is displayed
    #supuestamente aparee un codigo de coneccion entre los dispositivos para verificacion extra. Actualmente no funciona para android a ios
    And the receiver device presses the "Accept files" button
    Then the files from the sender device are sent
    And a success message is displayed in the sender device
    And a new folder is in the Recipient device with the received files

    Examples:
      | device1 | device2     |
      | Android | Android     |
      | Android | iOS         |
      | Android | Desktop App |
      | iOS     | iOS         |
      | iOS     | Android     |
      | iOS     | Desktop App |

  @Smoke @ConnectToDevice @Sender @QRConnect @E2E
  Scenario Outline: QR connect - Sender device - Success connection from <device1> to Recipient device <device2>
    Given the user <device1> is connected to the Recipient device <device2>
    And  the "Send files" screen is visible
    When the user fills in the title and selects a file from the option
      | Import from Tella app          |
      | from the device                |
      | takes a photo/video from Tella |
      | records an audio               |
    And the files are visible
    And the user presses "Send" button
    And the sender <device1> presses the "Confirm and Connect" button
    And the message ""Waiting for the recipient to accept files"" is displayed
    #supuestamente aparee un codigo de coneccion entre los dispositivos para verificacion extra. Actualmente no funciona para android a ios
    And the receiver device <device2> presses the "Accept files" button
    Then the files from the sender device are sent
    And a success message is displayed in the sender device
    And a new folder is in the Recipient device <device2> with the received files

    Examples:
      | device1 | device2     |
      | Android | Android     |
      | Android | iOS         |
      | Android | Desktop App |
      | iOS     | iOS         |
      | iOS     | Android     |
      | iOS     | Desktop App |

  @ConnectToDevice @Sender @Fail
  Scenario: Manual connect - Sender device - Fail connection by empty tittle
    Given the user is connected to the Recipient device
    And  the "Send files" screen is visible
    When the user DONT fills in the title and selects a file from the option
      | Import from Tella app          |
      | from the device                |
      | takes a photo/video from Tella |
      | records an audio               |
    And the files are visible
    Then the send button is not avaible

  @ConnectToDevice @Fail
  Scenario: Reject files
    Given the user is connected to the Recipient device
    And  the "Send files" screen is visible
    And the user fills in the title and uploads a file
    And the user presses "Send" button
    When the receiver press "Reject" buton
    Then the "Send files" screen is visible in the sender device

  @Smoke @ConnectToDevice
  Scenario: Stop receiving files
    Given the user is connected to the Recipient device
    And  the "Send files" screen is visible
    And the user fills in the title and uploads a file
    And the user presses "Send" button
    When the receiver press Cancel receiving
    Then the message "Transfer interrupted" is displayed in sender device
    And the receiving device can see that the files are not in its tella archives


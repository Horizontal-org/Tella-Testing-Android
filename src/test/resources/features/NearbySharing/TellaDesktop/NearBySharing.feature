@Regression @TellaDesktop @NearbySharing @SmokeManual
Feature: NearbySharing and Received
  # For now, the desktop app can only receive files, NOT send them.
  #Prepare the smoke when we have all the app working correctly

  @Received
  Scenario: Received files
  # Here you can see the received files; we still cannot see how this feature works. Not avaible yet
  Given
  When
  Then

  @NearbySharing
  Scenario: Nearby Sharing - Step 1
    Given the user’s PC and mobile are connected to the same Wi-Fi network
    When the user selects the checkbox "Yes, we are on the same Wi-Fi network"
    And the user presses the "Continue" button
    Then the user is on step 2 of Nearby Sharing

  @NearbySharing @Fail
  Scenario: Nearby Sharing - Step 1
    Given the user’s two devices are connected to the same Wi-Fi network
    When the user does NOT select the checkbox "Yes, we are on the same Wi-Fi network"
    And the user presses the "Continue" button
    Then the "Continue" button remains disabled

    # Test a case to see if it is possible to connect when the devices are on two different networks

  @NearbySharing
  Scenario: Nearby Sharing - Step 2 - Manual Connection
    Given the information "IP ADDRESS", "PIN", and "Port" is visible
    When the user sets the "IP ADDRESS", "PIN", and "Port" on the phone
    And the values match those shown on Tella Desktop
    Then the devices connect automatically
    # Review this case later when it can be verified

  @NearbySharing @Fail
  Scenario Outline: Nearby Sharing - Step 2 - Manual Connection fails due to incorrect <field>
    Given the user has the <field> configured on the PC
    When the user sets the <field> to <value> on the phone
    Then the devices do not connect automatically
    # Review this case later when it can be verified

    Examples:
      | field      | value                          |
      | IP ADDRESS | 000.000.000.00, 000.000.000.0  |
      | PIN        | 000000                         |
      | Port       | 00000                          |

  @NearbySharing
  Scenario: Nearby Sharing - Step 2 - Automatic connection with QR code
    Given the information "IP ADDRESS", "PIN", and "Port" is visible
    When the user presses the "See QR code" button
    Then the devices connect automatically
    # Review this case later when it can be verified

  @Received
  Scenario: Exit Nearby Sharing
    Given the user is on step 2 of Nearby Sharing
    When the user presses the "Received" button
    And the user sees a warning "If you exit Nearby Sharing, you will have to restart the process from the beginning."
    And the user presses the "Exit" button
    Then the user is in the "Received" section

  @Received
  Scenario: Cancel Exit Nearby Sharing
    Given the user is on step 2 of Nearby Sharing
    When the user presses the "Received" button
    And the user sees a warning "If you exit Nearby Sharing, you will have to restart the process from the beginning."
    And the user presses the "Continue Nearby Sharing" button
    Then the user remains on step 2 of Nearby Sharing

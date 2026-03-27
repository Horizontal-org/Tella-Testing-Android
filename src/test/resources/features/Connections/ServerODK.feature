@Regression @ODK @Servers
Feature: ODK

  Background:
    Given the user is in Tella home page
    And the user taps the settings icon
    And the user clicks on the option Connections
    And the user creates an Open Data Kit connection

  @Smoke @Automated
  Scenario: Download Forms
    When the user taps on the "ODK" connection
    And the user taps the refresh button in the Blank tab
    And the user taps the download button on the first form
    Then the message "Download completed" appears on the screen

  @Smoke @Automated #Ary's test form based
  Scenario Outline: Submit - Save a form for later
    When the user taps on the "Forms" connection
    And the user taps the refresh button in the Blank tab
    And the user taps the download button on the first form
    And the user taps the first form to fill out
    And the user completes all required fields in Ari's test
    And the user sends the form to <tab> tab
    Then the form "test_ary" should be in the "<tab>" tab

    Examples:
      | tab       |
      | Draft     |
      | Outbox    |
      | Submitted |

  @Smoke @Automated #Ary's test form based
  Scenario Outline: Delete a form from Draft - Outbox - Submitted
    Given the user has a saved form in the "<tab>" tab
    When the user taps the ⁝ button
    And the user selects Delete
    And the user presses confirm Delete button
    Then the message "The form was deleted" appears on the screen

    Examples:
      | tab       |
      | Draft     |
      | Outbox    |
      | Submitted |

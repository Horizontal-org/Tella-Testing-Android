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
  Scenario: Save a form for later - Outbox
    When the user taps on the "Forms" connection
    And the user taps the refresh button in the Blank tab
    And the user taps the download button on the first form
    And the user taps the first form to fill out
    And the user completes all required fields in Ari's test
    And the user taps the next form button
    And the user taps the clock icon
    Then the form "test_ary" should be in the "Outbox" tab

  @Smoke @Automated #Ary's test form based
  Scenario: Save a form for later - Draft
    When the user taps on the "Forms" connection
    And the user taps the refresh button in the Blank tab
    And the user taps the download button on the first form
    And the user taps the first form to fill out
    And the user completes all required fields in Ari's test
    And the user taps the Save icon
    And the user closes the form
    And the user taps the "Draft" tab
    Then the form "test_ary" should be in the "Draft" tab

  @Smoke @Automated #Ary's test form based
  Scenario: Delete a form from Draft
    Given the user has a saved form in the "Draft" tab
    When the user taps the ⁝ button
    And the user selects Delete
    And the user presses confirm Delete button
    Then the message "The form was deleted" appears on the screen

  @Smoke @Automated @testAbel #Ary's test form based
  Scenario: Delete a form from Outbox
    Given the user has a saved form in the "Outbox" tab
    When the user taps the ⁝ button
    And the user selects Delete
    And the user presses confirm Delete button
    Then the message "The form was deleted" appears on the screen


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
    And the user waits a taps the download button on the first form
    Then the approval message "Download completed" appears

  @Smoke @Automated #Ari's test form based
  Scenario: Save a form for later - Outbox
    When the user taps on the "Forms" connection
    And the user taps the refresh button in the Blank tab
    And the user waits a taps the download button on the first form
    And the user taps the first form to fill out
    And the user completes all required fields in Ari's test
    And the user taps the next form button
    And the user taps the clock icon
    Then the form is saved on the Outbox

  @Smoke @Candidate @testAbel
  Scenario: Save a form for later - Draft
    When the user taps on the "Forms" connection
    And the user taps the refresh button in the Blank tab
    And the user waits a taps the download button on the first form
    And the user taps the first form to fill out
    And the user completes all required fields in Ari's test
    And presses "Save" icon
    Then the form is saved on the Draft

  @Smoke @Candidate
  Scenario: Delete form from Draft
    Given the user has an form in Draft
    When the user taps on the "Forms" connection
    And the user selects the category Draft
    And the user taps the "⁝" button
    And selects Delete
    And confirms the Delete option
    Then the approval message ""The form was deleted"" appears


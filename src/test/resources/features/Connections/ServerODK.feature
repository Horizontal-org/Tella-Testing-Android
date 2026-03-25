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

  @Smoke @Candidate @testAbel
  Scenario: Save forms to Outbox
    When the user taps on the "Forms" connection
    And the user taps the refresh button in the Blank tab
    And the user waits a taps the download button on the first form
    And taps the new form to fill out
    And complete all the required fields on the first screen
    And press "Next" on the other screens
    And complete the required questions
    And presses "Next"
    And presses "Clock" icon
    Then the form is saved on the Outbox

  @Smoke @Candidate
  Scenario: Save forms to Draft
    When the user taps on the "Forms" connection
    And taps the new form to fill out
    And completes all the required fields
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


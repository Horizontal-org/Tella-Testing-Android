@Odk @Regression
Feature: ODK
  
  Background: 
    Given the user is authenticated in the Tella application with valid credentials
    And the user is in Tella home page
    And the user is connected to the ODK server
  
  @Smoke  
  Scenario: Download Forms 
    When the user taps on the "ODK" connection
    And presses the Download button in the download Blank
    Then the approval message "download completed" appears
    
	

Scenario: Save forms to Outbox
    When the user taps on the "Forms" connection
    And taps the new form to fill out
    And complete all the required fields on the first screen
	And press "Next" on the other screens
	And complete the required questions
    And presses "Next"
    And presses "Clock" icon 
    Then the form is saved on the Outbox 



Scenario: Save forms to Draft
    When the user taps on the "Forms" connection
    And taps the new form to fill out
    And completes all the required fields
    And presses "Save" icon 
    Then the form is saved on the Draft


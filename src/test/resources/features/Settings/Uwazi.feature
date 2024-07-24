@Uwazi 
Feature: Uwazi
  
  Background: 
    Given the user is authenticated in the Tella application with valid credentials
    And the user is in Tella home page
    And the user is connected to the Uwazi server
  
  @Smoke  
  Scenario: Download templates 
    When the user taps on the "Uwazi" connection
    And presses the "Add" icon
    And presses the Download button
  
  @Smoke
  Scenario: Submit entity without attachments
    When the user taps on the "Uwazi" connection
    
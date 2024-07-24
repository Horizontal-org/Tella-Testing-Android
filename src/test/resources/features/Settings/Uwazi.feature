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
    And presses the Download button in the download template
    Then a green checkmark appears next to the download template
    And the template is now on the Uwazi templates list, ready for the user to fill out
  
  @Smoke
  Scenario: Submit entity without attachments
    When the user taps on the "Uwazi" connection
    
  
  @Smoke
  Scenario: Submit entity with only primary document
    
  @Smoke
  Scenario: Submit entity with both primary document and supporting documentation
  
  @Smoke
  Scenario: Submit entities without authentication
    
  @Smoke
  Scenario: Submit entity with only supporting documentation
    
  @Smoke
  Scenario: Submit entity with large attachments while connected to internet, disconect/reconect internet several times
    
  @Smoke
  Scenario: Save entity as draft
  
  @Smoke
  Scenario: Save entity to outbox
    
  @Smoke
  Scenario: Delete entity in outbox
  
  @Smoke 
  Scenario: Delete sent entity
    
  @Smoke
  Scenario: Delete draft entity
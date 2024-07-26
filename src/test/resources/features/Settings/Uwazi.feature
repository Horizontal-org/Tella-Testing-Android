@Uwazi @Regression 
Feature: Uwazi
  
  Background: 
    Given the user is authenticated in the Tella application with valid credentials
    And the user is in Tella home page
    And the user is connected to the Uwazi server
  
  @Smoke  
  Scenario: Download templates 
    When the user taps on the "Uwazi" connection
    And taps the "+" button
    And presses the Download button in the download template
    Then a green checkmark appears next to the download template
    And the template is now on the Uwazi templates list, ready for the user to fill out
  
  @Smoke
  Scenario: Submit entity without attachments
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And presses "Next"
    And presses "Submit"
    Then the entity is saved on the Submitted tab with the corresponding information

  @Smoke
  Scenario Outline: Submit entity with only primary document
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a PDF file from the Primary Documents field with the option <selection>
    And presses "Next"
    And presses "Submit"
    And sees the file being uploaded
    Then the entity is saved on the Submitted tab with the corresponding information
    
    Examples:
      | selection               |
      | Select from Tella files |
      | Select from your device |
      
  @Smoke
  Scenario Outline: Submit entity with both primary document and supporting documentation
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a PDF file from the Primary Documents field with the option <selection>
    And selects a file from the Supporting files field with the option <option>
    And presses "Next"
    And presses "Submit"
    And sees the files being uploaded
    Then the entity is saved on the Submitted tab with the corresponding information
    
    Examples:
      | selection               | option                  |
      | Select from Tella files | Take photo with camera  |
      | Select from your device | Select from Tella files |
      | Select from Tella files | Select from your device |
  
  @Smoke #A qué se refiere? Desde una conexión pública? o sin completar el campo Nombre del form?
  Scenario: Submit entities without authentication
    
  @Smoke
  Scenario: Submit entity with only supporting documentation
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a file from the Supporting files field with the option <option>
    And presses "Next"
    And presses "Submit"
    And sees the file being uploaded
    Then the entity is saved on the Submitted tab with the corresponding information
    
    Examples:
      | option                  |
      | Take photo with camera  |
      | Select from Tella files |
      | Select from your device |
    
  @Smoke
  Scenario: Submit entity with large attachments while connected to internet, disconect/reconect internet several times
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And selects a large file from the Supporting files field with the option <option>
  
    
    Examples:
      | Select from Tella files |
      | Select from your device |
 
    
  @Smoke
  Scenario: Save entity to Outbox
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes all the required fields
    And presses "Next"
    And presses "Submit later"
    Then the entity is saved on the Outbox tab

  @Smoke
  Scenario: Save entity as Draft
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And completes the title
    And presses the "Save" icon
    Then the entity is saved on the Draft tab
    And the message "Entity is saved as draft" appears
    
  @Smoke
  Scenario Outline: Delete entity from <Category>
    Given the user has an entity in <Category>
    When the user taps on the "Uwazi" connection
    And the user selects the category <Category>
    And taps the "⁝" button of the corresponding entity
    And selects Delete 
    And confirms the Delete option
    Then the entity is deleted
    
    Examples: 
      | Category       |
      | Outbox         |
      | Submitted      |
      | Draft          |
       
  #The edit can be add files, change the title or the type of incident
  Scenario: Edit an entity from draft
    Given the user has an entity as draft
    When the user taps on the "Uwazi" connection
    And selects the category Draft
    And taps the "⁝" button of the corresponding entity
    And selects "Edit draft"
    And <edit> to the entity
    And presses the "Save" icon
    Then the edits are saved correctly to the entity as a draft
    
    Examples:
      | edit                          |
      | changes the title             |
      | changes the type of incident  |
      | adds a file                   | #debería especificar desde dónde siendo que todas las opciones dan error?
      | adds a geolocation            | 
       
  Scenario: Fail to submit an entity due to missing required fields 
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And presses "Next"
    Then the message "There were validation errors in some answers" appears
    
  Scenario: Fail to save entity as draft due to missing title
    When the user taps on the "Uwazi" connection
    And taps the new template to fill out
    And presses the "Save" icon
    Then the message "You must fill in the title" appears
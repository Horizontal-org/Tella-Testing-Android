Feature: Add a folder in Tella

  Background:
    Given the user has an account on Tella
    And has logged in to Tella
    Given is in the "All Files" folder

  Scenario: Successfully add a folder
    When the user taps the "+" button
    And the user taps the "Create" option
    And enters a valid folder name "folder1"
    And taps the "OK" button
    Then a folder with the specified name "folder1" is created

  Scenario: Successfully add a folder within another
    When the user taps the "Add Folder" button
    And enters a valid folder name "folder1"
    And taps the "Create" button
    And enters the "folder1"
    And taps the "Add Folder" button
    And enters a valid folder name "folder2"
    And taps the "Create" button
    Then "folder2" is successfully added

  Scenario: Add a new folder with a duplicate name
    When the user taps the "Add Folder" button
    And enters a folder name "folder1"
    And taps the "Create" button
    And selects to add a new folder
    And enters a folder name "folder1"
    And taps the "Create" button
    Then the folder is not created
    And a message is displayed indicating that a folder with the name "folder1" already exists
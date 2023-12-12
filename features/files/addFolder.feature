Feature: Add a Folder in Tella

Background:
Given the user has an account on Tella
And the user is logged in to Tella
Given the user is in the "All Files" folder

Scenario: Successfully add a folder
When the user taps the "Add Folder" button
And the user enters a valid folder name "folder1"
And the user taps the "Create" button
Then a folder with the specified name "folder1" is created

Scenario: Successfully add a folder within another
When the user taps the "Add Folder" button
And the user enters a valid folder name "folder1"
And the user taps the "Create" button
And the user enters "folder1"
And the user taps the "Add Folder" button
And the user enters a valid folder name "folder2"
And the user taps the "Create" button
Then "folder2" is successfully added

Scenario: Add a new folder with a duplicate name
When the user taps the "Add Folder" button
And the user enters a folder name "folder1"
And the user taps the "Create" button
And the user selects to add a new folder
And the user enters a folder name "folder1"
And the user taps the "Create" button
Then the folder is not created
And a message is displayed indicating that a folder with the name "folder1" already exists
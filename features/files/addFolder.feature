Feature: Add a Folder in Tella

Scenario: Successfully add a folder
Given I have an account on Tella
And I have logged in to Tella
And I am inside the "All files" folder
When I select to add a new folder
Then the folder is successfully added

Scenario: Successfully add a folder within another
Given I have an account on Tella
And I have logged in to Tella
And I am inside the "All files" folder
When I select to add a new folder
Then the folder is successfully added

Scenario: Add a new folder with a duplicate name
Given I have an account on Tella
And I have logged in to Tella
And I am inside the "All files" folder
When I select to add a new folder
Then the folder is successfully added

Scenario: Successfully move a file
Given I have an account on Tella
And I have logged in to Tella
And I am inside the "All files" folder
When I select to add a new folder
Then the folder is successfully added

Scenario: Successfully move multiple files
Given I have an account on Tella
And I have logged in to Tella
And I am inside the "All files" folder
When I select to add a new folder
Then the folder is successfully added
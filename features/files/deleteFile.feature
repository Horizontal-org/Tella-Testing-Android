Feature: Delete Files in Tella

Background:
Given I have an account on Tella
And I have logged in to Tella
And I am inside one of the main folders in the "files" section
And there are files within Tella

Scenario Outline: Delete a file in Tella
Given I have a <type> file in the folder
When I select to delete the <type> file from the list
And confirm the deletion
Then the <type> file is removed from the folder

Examples:
| type     |
| image    |
| video    |
| audio    |
| document |

Scenario: Delete multiple files in Tella
When I select multiple files
And choose to delete
And confirm the deletion
Then the files are removed from the folder
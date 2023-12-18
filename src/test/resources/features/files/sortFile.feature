Feature: Sort Files in Tella

Background:
Given I have an account on Tella
And I have logged in to Tella
And I am inside one of the main folders in the "files" section

Scenario Outline: Sort files by order type in a folder
When I choose to sort files by <order>
Then the files are displayed according to the specified order
And the selected order persists upon re-entering the folder

Examples:
| order                 |
| From newest to oldest |
| From oldest to newest |
| Name A-Z              |
| Name Z-A              |

Scenario Outline: Sort files by view type in a folder
When I select the option to sort files by <view>
Then the files are displayed according to the selected order
And the <view> selected view persists upon re-entering the folder

Examples:
| view |
| list |
| grid |
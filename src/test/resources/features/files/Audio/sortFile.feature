Feature: Organize files in the "Audio" folder

Background:
Given that the user is unlocked in the Tella app
And is within the "Audio" folder

@Regression  @AudioFolder @SortFile
Scenario Outline: Sort files by <sortBy> in the "Audio" folder
When the user taps the "Name ↑" icon
And chooses to sort files in <sortBy> order
Then the files are displayed according to the specified order
And the selected <sortBy> order persists upon re-entering the folder

Examples:
  | sortBy                |
  | From newest to oldest |
  | From oldest to newest |
  | Name A-Z              |
  | Name Z-A              |

@Regression  @AudioFolder @SortFile
Scenario Outline: Sort files by <view> in the "Audio" folder
When the user taps the <view> button
Then the files are displayed according to the selected view
And the selected <view> persists upon re-entering the folder

Examples:
  | view |
  | grid |
  | list |
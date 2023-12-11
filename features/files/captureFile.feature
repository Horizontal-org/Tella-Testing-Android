Feature: Capture an image, video, and audio file from a folder

Scenario Outline: Capture a file from a folder in Tella
Given I have an account on Tella
And I log in to Tella
And I am inside one of the main folders in the "files" section
When I select the option to add a file of type <type>
And I capture the <type> file
Then the <type> file is successfully saved in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder

Examples:
| type | folder |
| image | Images |
| video | Videos |
| audio | Audios |
Feature: Capture a file from the "Images" folder

Background:
Given the user has an account on Tella
And logs in to Tella
And is within the "Images" folder

Scenario Outline: Capture a <type> file from the "Images" folder
When the user taps the "+" button
And selects the "Take photo/video" option
And selects the <option> option
And captures the <type> file
Then the message "file encrypted" appears
And the <type> file is saved correctly in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder

Examples:
| type  | folder |
| image | Images |
| video | Videos |

Scenario: Record an audio from the "Images" folder
When the user taps the "+" button
And selects the "Record audio" option
And captures the audio
Then the message "The audio recording was saved to your Tella files" appears
And the audio file is saved correctly in the "Audios" folder
And the audio file appears in the list of files in the "Audios" folder
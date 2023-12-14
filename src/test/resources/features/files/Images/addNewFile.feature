Feature: Add files from the "Images" folder

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

Scenario Outline: Import a <type> file from the "Images" folder while preserving the original
When the user taps the "+" button
And selects the "Import from device" option
And taps the "Keep original" button
And taps the "Continue" button
And selects a <type> file from the device
Then the file is saved in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder

Examples:
| type      | folder    |
| image.jpg | Images    |
| image.png | Images    |
| video.MP4 | Videos    |
| video.MOV | Videos    |
| audio.MP3 | Audios    |
| audio.AAC | Audios    |
| doc.PDF   | Documents |
| doc.DOCX  | Documents |
| .zip      | All Files |
| .rar      | All Files |

Scenario Outline: Import a <type> file from the "Images" folder while deleting the original
When the user taps the "+" button
And selects the "Import from device" option
And taps the "Delete original" button
And taps the "Continue" button
And selects a <type> file from the device
Then the file is saved in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder

Examples:
| type      | folder     |
| image.jpg | Images     |
| image.png | Images     |
| video.MP4 | Videos     |
| video.MOV | Videos     |
| audio.MP3 | Audios     |
| audio.AAC | Audios     |
| doc.PDF   | Documents  |
| doc.DOCX  | Documents  |
| .zip      | All files  |
| .rar      | All files  |

Scenario Outline: Import a duplicated <type> file from the "Images" folder
When the user taps the "+" button
And selects the "Import from device" option
And taps the "Keep original" button
And taps the "Continue" button
And selects a <type> file from the device
And taps the "+" button again
And selects the "Import from device" option
And taps the "Keep original" button
And taps the "Continue" button
And selects another <type> file from the device
Then the duplicated file is imported correctly with a different name
And the <type> file appears in the list of files in the <folder> folder

Examples:
| type      | folder    |
| image.jpg | Images    |
| video.MP4 | Videos    |
| audio.MP3 | Audios    |
| doc.PDF   | Documents |
| .zip      | All files |
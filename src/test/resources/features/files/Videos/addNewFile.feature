Feature: Add files from the "Videos" folder

Background:
Given the user has an account on Tella
And logs in to Tella
And is within the "Videos" folder

Scenario Outline: Capture a file of type <type> from the "Videos" folder
When the user taps the "+" button
And selects the option "Take photo/video"
And selects the option <option>
And captures the file of type <type>
Then the message "file encrypted" appears
And the file of type <type> is saved correctly in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>

  Examples:
  | type   | folder   | option |
  | image  | Images   | Photo  |
  | video  | Videos   | Video  |

Scenario: Record audio from the "Videos" folder
When the user taps the "+" button
And selects the option "Record audio"
And captures the audio
Then the message "The audio recording was saved to your Tella files" appears
And the audio file is saved correctly in the "Audios" folder
And the audio file appears in the list of files in the "Audios" folder

Scenario Outline: Import a file of type <type> from the "Videos" folder preserving the original
When the user taps the "+" button
And selects the option "Import from device"
And taps the "KEEP ORIGINAL" button
And taps the "Continue" button
And selects a file of type <type> from the device
Then the file is saved in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>

Examples:
  | type           | folder     |
  | image.jpg      | Images     |
  | image.png      | Images     |
  | video.MP4      | Videos     |
  | video.MOV      | Videos     |
  | audio.MP3      | Audios     |
  | audio.AAC      | Audios     |
  | document.PDF   | Documents  |
  | document.DOCX  | Documents  |

Scenario Outline: Import a file of type <type> from the "Videos" folder, deleting the original
When the user taps the "+" button
And selects the option "Import from device"
And taps the "DELETE ORIGINAL" button
And taps the "Continue" button
And selects a file of type <type> from the device
Then the file is saved in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>
And the original file is deleted from the device

Examples:
  | type           | folder     |
  | image.jpg      | Images     |
  | image.png      | Images     |
  | video.MP4      | Videos     |
  | video.MOV      | Videos     |
  | audio.MP3      | Audios     |
  | audio.AAC      | Audios     |
  | document.PDF   | Documents  |
  | document.DOCX  | Documents  |
  | .zip           | All files  |
  | .rar           | All files  |

Scenario Outline: Import a duplicate file of type <type> from the "Videos" folder
When the user taps the "+" button
And selects the option "Import from device"
And taps the "KEEP ORIGINAL" button
And taps the "Continue" button
And selects a file of type <type> from the device
And taps the "+" button again
And selects the option "Import from device"
And taps the "KEEP ORIGINAL" button
And taps the "Continue" button
And selects a file of type <type> from the device
Then the duplicate file is imported correctly with a different name
And the file of type <type> appears in the list of files in the folder <folder>

Examples:
  | type       | folder     |
  | image.jpg  | Images     |
  | video.MP4  | Videos     |
  | audio.MP3  | Audios     |
  | doc.PDF    | Documents  |
  | .zip       | All files  |

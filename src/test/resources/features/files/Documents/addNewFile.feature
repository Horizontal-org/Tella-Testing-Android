Feature: Add Files from the "Documents" Folder

Background:
Given the user has an account on Tella
And logs in to Tella
And is within the "Documents" folder

Scenario Outline: Capture a file of type <type> from the "Documents" folder
When they tap the "+" button
And select the option "Take photo/video"
And select the option <option>
And capture the file of type <type>
Then the message "file encrypted" appears
And the file of type <type> is saved correctly in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>

  Examples:
  | type   | folder   | option |
  | image  | Images   | Photo  |
  | video  | Videos   | Video  |

Scenario: Record a document from the "Documents" folder
When they tap the "+" button
And select the option "Record audio"
And capture the audio
Then the message "The audio recording was saved to your Tella files" appears
And the audio file is saved correctly in the "Documents" folder
And the audio file appears in the list of files in the "Documents" folder

Scenario Outline: Import a file of type <type> from the "Documents" folder preserving the original
When they tap the "+" button
And select the option "Import from device"
And tap the button "KEEP ORIGINAL"
And tap the button "Continue"
And select a file of type <type> from the device
Then the file is saved in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>

Examples:
  | type           | folder      |
  | image.jpg      | Images      |
  | image.png      | Images      |
  | video.MP4      | Videos      |
  | video.MOV      | Videos      |
  | audio.MP3      | Audios      |
  | audio.AAC      | Audios      |
  | document.PDF   | Documents   |
  | document.DOCX  | Documents   |

Scenario Outline: Import a file of type <type> from the "Documents" folder deleting the original
When they tap the "+" button
And select the option "Import from device"
And tap the button "DELETE ORIGINAL"
And tap the button "Continue"
And select a file of type <type> from the device
Then the file is saved in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>
And the original file is deleted from the device

Examples:
  | type           | folder      |
  | image.jpg      | Images      |
  | image.png      | Images      |
  | video.MP4      | Videos      |
  | video.MOV      | Videos      |
  | audio.MP3      | Audios      |
  | audio.AAC      | Audios      |
  | document.PDF   | Documents   |
  | document.DOCX  | Documents   |
  | .zip           | All files   |
  | .rar           | All files   |

Scenario Outline: Import a duplicated file of type <type> from the "Documents" folder
When they tap the "+" button
And select the option "Import from device"
And tap the button "KEEP ORIGINAL"
And tap the button "Continue"
And select a file of type <type> from the device
And tap the "+" button again
And select the option "Import from device"
And tap the button "KEEP ORIGINAL"
And tap the button "Continue"
And select a file of type <type> from the device
Then the duplicated file is imported correctly with a different name
And the file of type <type> appears in the list of files in the folder <folder>

Examples:
  | type       | folder      |
  | image.jpg  | Images      |
  | video.MP4  | Videos      |
  | audio.aac  | Audios      |
  | doc.PDF    | Documents   |
  | .zip       | All files   |

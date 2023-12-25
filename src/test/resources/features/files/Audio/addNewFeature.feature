Feature: Add Files from the "Audio" Folder

Background:
Given that the user is unlocked in the Tella app
And is within the "Audio" folder

@Smoke 
Scenario Outline: Capture a file of type <type> from the "Audio" folder
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

@Smoke
Scenario: Record an audio from the "Audio" folder
When they tap the "+" button
And select the option "Record audio"
And capture the audio
Then the message "The audio recording was saved to your Tella files" appears
And the audio file is saved correctly in the "Audios" folder
And the audio file appears in the list of files in the "Audios" folder

@Smoke @Regression
Scenario Outline: Import a file of type <type> from the "Audio" folder preserving the original
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
  | video.mp4      | Videos      |
  | video.mov      | Videos      |
  | audio.mp3      | Audios      |
  | audio.aac      | Audios      |
  | document.pdf   | Documents   |
  | document.docx  | Documents   |

@Smoke @Regression
Scenario Outline: Import a file of type <type> from the "Audio" folder deleting the original
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
  | video.mp4      | Videos      |
  | video.mov      | Videos      |
  | audio.mp3      | Audios      |
  | audio.aac      | Audios      |
  | document.pdf   | Documents   |
  | document.docx  | Documents   |

@Smoke @Regression
Scenario Outline: Import a duplicated file of type <type> from the "Audio" folder
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
  | video.mp4  | Videos      |
  | audio.aac  | Audios      |
  | doc.pdf    | Documents   |

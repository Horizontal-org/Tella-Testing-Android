Feature: Add Files from the "All files" Folder

Background:
Given that the user is unlocked in the Tella app
And is within the "All files" folder
And there are image, video, audio and documents files in the "All files" folder

@Smoke @CaptureFile @AllFilesFolder
Scenario Outline: Capture a file of type <type> from the "All files" folder
When they tap the "+" button
And select the option "Take photo/video"
And select the option <option>
And capture the file of type <type>
Then the message "file encrypted" appears
And the file of type <type> is saved correctly in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>
And the file appears in the "All files" folder

Examples:
  | type   | folder   | option |
  | image  | Images   | Photo  |
  | video  | Videos   | Video  |

@Smoke @CaptureFile @AllFilesFolder
Scenario: Record an audio file from the "All files" folder
When they tap the "+" button
And select the option "Record audio"
And capture the audio
Then the message "The audio recording was saved to your Tella files" appears
And the audio file is saved correctly in the "Audio" folder
And the audio file appears in the list of files in the "Audio" folder

@Smoke @ImportFile @AllFilesFolder
Scenario Outline: Import a file of type <type> from the "All files" folder - preserving the original
When they tap the "+" button
And select the option "Import from device"
And tap the "KEEP ORIGINAL" button
And tap the "Continue" button
And select a file of type <type> from the device
Then the file is saved in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>
And the file appears in the "All files" folder

Examples:
  | type           | folder      |
  | image.jpg      | Images      |
  | video.mp4      | Videos      |
  | audio.mp3      | Audios      |
  | document.pdf   | Documents   |

@Regression @ImportFile @AllFilesFolder
Scenario Outline: Import a file of type <type> from the "All files" folder - deleting the original
When they tap the "+" button
And select the option "Import from device"
And tap the "DELETE ORIGINAL" button
And tap the "Continue" button
And select a file of type <type> from the device
Then the file is saved in the folder <folder>
And the file of type <type> appears in the list of files in the folder <folder>
And The original file is deleted from the device

Examples:
  | type           | folder      |
  | image.jpg      | Images      |
  | video.mp4      | Videos      |
  | audio.mp3      | Audios      |
  | document.pdf   | Documents   |

@Regression @ImportFile @AllFilesFolder
Scenario Outline: Import a duplicate file of type <type> from the "All files" folder
When they tap the "+" button
And select the option "Import from device"
And tap the "KEEP ORIGINAL" button
And tap the "Continue" button
And select a file of type <type> from the device
And tap the "+" button again
And select the option "Import from device"
And tap the "KEEP ORIGINAL" button
And tap the "Continue" button
And select a file of type <type> from the device
Then the duplicate file is imported correctly with a different name
And the file of type <type> appears in the list of files in the folder <folder>
And the file appears in the "All files" folder

Examples:
  | type       | folder    |
  | image.jpg  | Images    |
  | video.mp4  | Videos    |

@Smoke @ImportFile @AllFilesFolder
Scenario: Successfully add a folder
When they tap the "+" button
And select the option "Create"
And enter a folder name "folder1"
And tap the "OK" button
Then a folder with the specified name "folder1" is created

@Smoke @ImportFile @AllFilesFolder
Scenario: Successfully add a folder inside another
When they tap the "+" button
And select the option "Create"
And enter a folder name "folder1"
And tap the "OK" button
And enter the "folder1"
And tap the "+" button
And select the option "Create"
And enter a folder name "folder2"
And tap the "OK" button
And tap the "Create" button
Then "folder2" is successfully created inside "folder1"

@Regression @AllFilesFolder
Scenario: Attempt to add a new folder with a duplicate name
When they tap the "+" button
And select the option "Create"
And enter a folder name "folder1"
And tap the "OK" button
When they tap the "+" button
And select the option "Create"
And enter a folder name "folder1"
And tap the "OK" button
Then the folder is not created

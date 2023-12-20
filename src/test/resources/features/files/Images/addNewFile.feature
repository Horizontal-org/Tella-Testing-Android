Feature: Add files from the "Images" folder

Background:
Given that the user is unlocked in the Tella app
And is within the "Images" folder
And there are image files in the "Images" folder

@Smoke @ImagesFolder @CaptureFile
Scenario Outline: Capture a <type> file from the "Images" folder
When the user taps the "+" button
And selects the "Take photo/video" option
And selects the <option> option
And captures the <type> file
Then the message "file encrypted" appears
And the <type> file is saved correctly in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder

Examples:
    | type   | folder   | option |
    | image  | Images   | Photo  |
    | video  | Videos   | Video  |

@Smoke @ImagesFolder @CaptureFile
Scenario: Record an audio from the "Images" folder
When the user taps the "+" button
And selects the "Record audio" option
And captures the audio
Then the message "The audio recording was saved to your Tella files" appears
And the audio file is saved correctly in the "Audios" folder
And the audio file appears in the list of files in the "Audios" folder

@Smoke @ImagesFolder @ImportFile
Scenario Outline: Import a <type> file from the "Images" folder while preserving the original
When the user taps the "+" button
And selects the "Import from device" option
And taps the "KEEP ORIGINAL" button
And taps the "Continue" button
And selects a <type> file from the device
Then the file is saved in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder

Examples:
  | type           | folder      |
  | image.jpg      | Images      |
  | image.png      | Images      |

@Smoke @ImagesFolder @ImportFile
Scenario Outline: Import a <type> file from the "Images" folder while deleting the original
When the user taps the "+" button
And selects the "Import from device" option
And taps the "Delete original" button
And taps the "Continue" button
And selects a <type> file from the device
Then the file is saved in the <folder> folder
And the <type> file appears in the list of files in the <folder> folder
And the original file is deleted from the device

Examples:
  | type           | folder      |
  | image.jpg      | Images      |
  | image.png      | Images      |
  
@Regression @ImagesFolder @ImportFile
Scenario Outline: Import a duplicated image file from the "Images" folder
When the user taps the "+" button
And selects the "Import from device" option
And taps the "KEEP ORIGINAL" button
And taps the "Continue" button
And selects a "image.jpg" file from the device
And taps the "+" button again
And selects the "Import from device" option
And taps the "KEEP ORIGINAL" button
And taps the "Continue" button
And selects another "image.jpg"  file from the device
Then the duplicated file is imported correctly with a different name
And the "image.jpg" file appears in the list of files in the "Images" folder
Feature: File Options in the "Audio" Folder

Background:
Given that the user is unlocked in the Tella app
And is in the "Audio" folder
And the files "audio1.aac" and "audio2.aac" exist

@Smoke @AudioFolder 
Scenario: Open an audio from the "Audios" folder
When they click on an "audio1.aac" in the "Audios" folder
Then it directs to the audio player

@Regression @AudioFolder 
Scenario: Rename an audio file in the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Rename"
And enters the name: "audio"
And presses "OK"
Then the file name is updated

@Regression @AudioFolder 
Scenario: Cancel renaming an audio file in the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Rename"
And enters the name: "audio"
And presses "CANCEL"
Then the file name is not updated

@Regression @AudioFolder 
Scenario: Rename a file with an identical name to an existing file in the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Rename"
And enters the name: "audio2.aac"
And presses "OK"
Then the file name is not updated

@Smoke @ShareFile @AudioFolder 
Scenario Outline: Share an audio file via <SocialMedia> from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared correctly

Examples:
  | SocialMedia | shareInformation                       |
  | WhatsApp    | share files + verification information |
  | Instagram   | share files only                       |

@Smoke @ShareFile @AudioFolder 
Scenario Outline: Share multiple audio files via <SocialMedia> from the "Audio" folder
When the user clicks on the "v" button to select files
And selects "audio1.aac" and "audio2.aac"
And taps the "Share" button
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared correctly

Examples:
  | SocialMedia | shareInformation                       |
  | WhatsApp    | share files + verification information |
  | Instagram   | share files only                       |
  
@Regression @AudioFolder @ShareFile
Scenario Outline: Cancel sharing an audio file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "CANCEL"
Then the dialog box is closed
And the file is not shared

@Smoke @SaveFile @AudioFolder
Scenario: Save an audio file to the device
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the file is saved correctly to the device
And the message "1 file saved to the device" appears

Examples:
  | shareInformation                       |
  | share files + verification information |
  | share files only                       |

@Smoke @SaveFile @AudioFolder
Scenario: Save multiple audio files to the device
When the user clicks on the "v" button to select files
And selects "audio1.aac" and "audio2.aac"
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the file is saved correctly to the device
And the message "1 file saved to the device" appears

Examples:
  | shareInformation                       |
  | share files + verification information |
  | share files only                       |

@Smoke @DeleteFile @AudioFolder
Scenario: Delete an audio file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Delete"
And taps "Delete"
Then the file is deleted
And the message "The file was deleted" appears

@Smoke @DeleteFile @AudioFolder
Scenario: Delete multiple audio files from the "Audio" folder
When the user clicks on the "v" button to select files
And selects "audio1.aac" and "audio2.aac"
When  taps the options button "⋮"
And selects the option "Delete"
Then the files are deleted
And the message "The file was deleted" appears

@Regression @DeleteFile @AudioFolder
Scenario: Cancel deleting an audio file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "Delete"
And taps "Cancel"
Then the file is not deleted
And the dialog box is closed

@Regression @AudioFolder @ViewInformation
Scenario: View the information of a file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.aac"
And selects the option "File information"
Then the file information appears
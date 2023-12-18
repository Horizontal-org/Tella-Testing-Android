Feature: File Options in the "Audio" Folder

Background:
Given the user has an account on Tella
And has logged in to Tella
And is in the "Audio" folder
And the files "audio1.mp3" and "audio2.mp3" exist

Scenario: Open an audio from the "Audios" folder
When they click on an "audio1.mp3" in the "Audios" folder
Then it directs to the audio player

Scenario: Rename an audio file in the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Rename"
And enters the name: "audio"
And presses "OK"
Then the file name is updated

Scenario: Cancel renaming an audio file in the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Rename"
And enters the name: "audio"
And presses "CANCEL"
Then the file name is not updated

Scenario: Rename a file with an identical name to an existing file in the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Rename"
And enters the name: "audio2.mp3"
And presses "OK"
Then the file name is not updated

Scenario Outline: Share an audio file via <SocialMedia> from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared correctly

Examples:
  | SocialMedia | shareInformation                       |
  | WhatsApp    | share files + verification information |
  | WhatsApp    | share files only                       |
  | Instagram   | share files + verification information |
  | Instagram   | share files only                       |
  | Gmail       | share files + verification information |
  | Gmail       | share files only                       |

Scenario Outline: Share multiple audio files via <SocialMedia> from the "Audio" folder
When the user clicks on the "v" button to select files
And selects "audio1.mp3" and "audio2.mp3"
And taps the "Share" button
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared correctly

Examples:
  | SocialMedia | shareInformation                       |
  | WhatsApp    | share files + verification information |
  | WhatsApp    | share files only                       |
  | Instagram   | share files + verification information |
  | Instagram   | share files only                       |
  | Gmail       | share files + verification information |
  | Gmail       | share files only                       |

Scenario Outline: Cancel sharing an audio file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "CANCEL"
Then the dialog box is closed
And the file is not shared

Scenario: Save an audio file to the device
When the user taps the options button "⋮" for the file "audio1.mp3"
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

Scenario: Save multiple audio files to the device
When the user clicks on the "v" button to select files
And selects "audio1.mp3" and "audio2.mp3"
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

Scenario: Delete an audio file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Delete"
And taps "Delete"
Then the file is deleted
And the message "The file was deleted" appears

Scenario: Delete multiple audio files from the "Audio" folder
When the user clicks on the "v" button to select files
And selects "audio1.mp3" and "audio2.mp3"
When  taps the options button "⋮"
And selects the option "Delete"
Then the files are deleted
And the message "The file was deleted" appears

Scenario: Cancel deleting an audio file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "Delete"
And taps "Cancel"
Then the file is not deleted
And the dialog box is closed

Scenario: View the information of a file from the "Audio" folder
When the user taps the options button "⋮" for the file "audio1.mp3"
And selects the option "File information"
Then the file information appears

Feature: File Options in the "Videos" Folder

Background:
Given that the user is unlocked in the Tella app
And is in the "Videos" folder
And the files "video1.mp4" and "video2.mp4" exist

Scenario: Open a video from the "Videos" folder
When they click on a "video1.mp4" in the "Videos" folder
Then the video plays

Scenario: Rename a video file in the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Rename"
And enters the name: "video"
And presses "OK"
Then the file name is updated

Scenario: Cancel renaming a video file in the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Rename"
And enters the name: "video"
And presses "CANCEL"
Then the file name is not updated

Scenario: Rename a file with an identical name to an existing file
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Rename"
And enters the name: "video2.mp4"
And presses "OK"
Then the file name is not updated

Scenario Outline: Share a video file via <SocialMedia> from the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared successfully

Examples:
| SocialMedia | shareInformation                       |
| WhatsApp    | share files + verification information |
| WhatsApp    | share files only                       |
| Instagram   | share files + verification information |
| Instagram   | share files only                       |
| Gmail       | share files + verification information |
| Gmail       | share files only                       |

Scenario Outline: Share multiple video files via <SocialMedia> from the "Videos" folder
When the user clicks on the "v" button to select files
And selects "video1.mp4" and "video2.mp4"
And taps the "Share" button
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the files are shared successfully

Examples:
| SocialMedia | shareInformation                       |
| WhatsApp    | share files + verification information |
| WhatsApp    | share files only                       |
| Instagram   | share files + verification information |
| Instagram   | share files only                       |
| Gmail       | share files + verification information |
| Gmail       | share files only                       |

Scenario Outline: Cancel sharing a video file from the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "CANCEL"
Then the dialog box is closed
And the file is not shared

Scenario: Save a video file to the device
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the file is saved successfully to the device
And the message "1 file saved to the device" appears

Examples:
| shareInformation                       |
| share files + verification information |
| share files only                       |

Scenario: Save multiple video files to the device
When the user clicks on the "v" button to select files
And selects "video1.mp4" and "video2.mp4"
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the files are saved successfully to the device
And the message "1 file saved to the device" appears

Examples:
| shareInformation                       |
| share files + verification information |
| share files only                       |

Scenario: Delete a video file from the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Delete"
And taps "Delete"
Then the file is deleted
And the message "The file was deleted" appears

Scenario: Delete multiple video files from the "Videos" folder
When the user clicks on the "v" button to select files
And selects "video1.mp4" and "video2.mp4"
When  taps the options button "⋮"
And selects the option "Delete"
Then the files are deleted
And the message "The file was deleted" appears

Scenario: Cancel deleting a video file from the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "Delete"
And taps "Cancel"
Then the file is not deleted
And the dialog box is closed

Scenario: View the information of a file from the "Videos" folder
When the user taps the options button "⋮" for the file "video1.mp4"
And selects the option "File information"
Then the file information appears
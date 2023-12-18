Feature: File Options in the "All files" folder

Background:
Given that the user is unlocked in the Tella app
And is in the "All files" folder
And in the "All files" folder, there are files: audio, image, video, and documents

Scenario Outline: Open files from "All Files" folder
When they click on a <File> in the "All Files" folder 
Then <Result>

Examples:
  | File      | Result                                           |
  | image     | the image opens                                  |
  | video     | the video plays                                  |
  | audio     | it directs to the audio player                   |
  | document  | the option to import the file appears to open it |

Scenario Outline: Rename a file of type <type> from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Rename"
And enters the name: <name>
And presses "OK"
Then the file name is updated
Examples:
  | type          | name |
  | image.jpg     | img  |
  | video.mp4     | vid  |
  | audio.mp3     | aud  |
  | document.pdf  | docu |

Scenario Outline: Cancel renaming a file of type <type> from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Rename"
And presses "CANCEL"
Then the file name is not updated
Examples:
  | type          |
  | image.jpg     |
  | video.mp4     |
  | audio.mp3     |
  | document.pdf  |

Scenario Outline: Rename a file of type <existing_file> with an identical name to an existing file from the "All files" folder
When the user taps the options button "⋮" of the file "<existing_file>"
And selects the option "Rename"
And enters the name: "<new_name>"
And presses "OK"
Then the file name is not updated
Examples:
  | existing_file  | new_name    |
  | image1.jpg     | video1.MP4  |
  | video1.MP4     | image1.jpg  |
  | audio1.MP3     | document1.PDF |
  | document1.PDF  | audio1.MP3  |

Scenario Outline: Share a file of type <type> through <SocialMedia> from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the file is shared successfully
Examples:
  | SocialMedia | type          | shareInformation                       |
  | WhatsApp    | audio.mp3     | share files + verification information |
  | WhatsApp    | audio.mp3     | share files only                       |
  | Instagram   | image.jpg     | share files + verification information |
  | Instagram   | image.jpg     | share files only                       |
  | Gmail       | document.pdf  | share files + verification information |
  | Gmail       | document.pdf  | share files only                       |

Scenario Outline: Share multiple files of type <type> through <SocialMedia> from the "All files" folder
When the user clicks on the "v" button to select files
And selects <type>
And taps the "Share" button
And taps "Continue"
And selects <shareInformation>
And taps "OK"
And selects <SocialMedia>
Then the files are shared successfully
Examples:
  | SocialMedia | shareInformation                       | type                                 |
  | WhatsApp    | share files + verification information | audio.mp3, image.jpg, document.pdf   |
  | WhatsApp    | share files only                       | audio.mp3, image.jpg, document.pdf   |
  | Instagram   | share files + verification information | video.mp4, image.jpg, document.pdf   |
  | Instagram   | share files only                       | video.mp4, image.jpg, document.pdf   |
  | Gmail       | share files + verification information | document.pdf, audio.mp3, image.jpg   |
  | Gmail       | share files only                       | document.pdf, audio.mp3, image.jpg   |

Scenario Outline: Cancel sharing a file of type <type> from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Share"
And taps "Continue"
And selects <shareInformation>
And taps "CANCEL"
Then the dialog box is closed
And the file is not shared
Examples:
  | type          |
  | image.jpg     |
  | video.mp4     |
  | audio.mp3     |
  | document.pdf  |

Scenario Outline: Save a file of type <type> to the device
When the user taps the options button "⋮" of the file <type>
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the file is saved successfully to the device
And the message appears: "1 file saved to the device"
Examples:
  | type          | shareInformation                       |
  | image.jpg     | share files + verification information |
  | image.jpg     | share files only                       |
  | video.mp4     | share files + verification information |
  | video.mp4     | share files only                       |
  | audio.mp3     | share files + verification information |
  | audio.mp3     | share files only                       |
  | document.pdf  | share files + verification information |
  | document.pdf  | share files only                       |

Scenario Outline: Save multiple files of type <type> to the device
When the user clicks on the "v" button to select files
And selects <type>
And selects the option "Save to device"
And presses "Save"
And selects <shareInformation>
And taps "Continue"
And selects a location on the device
And presses the "USE THIS FOLDER" button
Then the files are saved successfully to the device
And the message appears: "1 file saved to the device"
Examples:
  | shareInformation                       | type                                 |
  | share files + verification information | audio.mp3, image.jpg, document.pdf   |
  | share files only                       | audio.mp3, image.jpg, document.pdf   |

Scenario Outline: Delete a file of type <type> from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Delete"
And taps "Delete"
Then the file is deleted
And the message appears: "the file was deleted"
Examples:
  | type          |
  | image.jpg     |
  | video.mp4     |
  | audio.mp3     |
  | document.pdf  |

Scenario: Delete multiple files of type <type> from the "All files" folder
When the user clicks on the "v" button to select files
And selects <type>
When  taps the options button "⋮"
And taps the option "Delete"
Then the files are deleted
And the message appears: "the file was deleted"
Examples:
  | type                                 |
  | audio.mp3, image.jpg, document.pdf   |
  | audio.mp3, image.jpg, document.pdf   |

Scenario Outline: Cancel deleting a file of type <type> from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Delete"
And taps "Cancel"
Then the file is not deleted
And the dialog box is closed
Examples:
  | type          |
  | image.jpg     |
  | video.mp4     |
  | audio.mp3     |
  | document.pdf  |

Scenario Outline: View the information of a file from the "All files" folder
When the user taps the options button "⋮" of the file <type>
And selects the option "File information"
Then the file information appears
Examples:
  | type          |
  | image.jpg     |
  | video.mp4     |
  | audio.mp3     |
  | document.pdf  |
  
Scenario Outline: Move a file of type <type> to another existing folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Move to another folder"
And selects a destination folder "Folder1"
And taps the option "MOVE HERE"
Then the <type> file is moved to the "Folder1" folder
And the message appears: "File successfully moved"

Examples:
| type          |
| image.jpg     |
| video.mp4     |
| audio.mp3     |
| document.pdf  |

Scenario Outline: Cancel the option to move a file of type <type> to another folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Move to another folder"
And taps the option "CANCEL"
Then the option to move the file is canceled

Examples:
| type          |
| image.jpg     |
| video.mp4     |
| audio.mp3     |
| document.pdf  |

Scenario Outline: Move a file of type <type> by creating a folder
When the user taps the options button "⋮" of the file <type>
And selects the option "Move to another folder"
And taps the option "+"
And enters a name for the folder <fileName>
And taps the option "MOVE HERE"
Then the <type> file is moved to the <fileName> folder
And the message appears: "File successfully moved"

Examples:
| type          |
| image.jpg     |
| video.mp4     |
| audio.mp3     |
| document.pdf  |



  
  
  
  
  
  
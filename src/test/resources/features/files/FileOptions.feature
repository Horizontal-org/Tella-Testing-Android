@Files @FileOptions @Regression
Feature: File Options

  Background:
    Given that the user is unlocked in the Tella application
    And there are files and folders within Tella
    And they are on the Tella Home screen

 @Smoke @ToBeAutomated
 Scenario Outline: Open a multimedia file <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps on a <type> file
   Then the <type> file is opened
   
   Examples:
     | folder     | type   |
     | All files  | image  |
     | Images     | image  |
     | Videos     | video  |
     | Audio      | audio  |

 @Smoke @ToBeAutomated
 Scenario Outline: Rename a file of <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" of the <type> file
   And selects the option "Rename"
   And enters the name: "asdf"
   And presses "Ok"
   Then the file name is updated
   
   Examples:
     | folder     | type      |
     | Images     | image     |
     | Documents  | document  |
     | Audios     | audio     |
     | Videos     | video     |

 Scenario Outline: Rename a file <type> with a name identical to an existing file
   When the user enters the folder <folder>
   And taps the options button "⋮" of a <type> file
   And selects the option "Rename"
   And enters the name: "asdf"
   And presses "Ok"
   And the user taps the options button "⋮" of another <type> file
   And selects the option "Rename"
   And enters the name: "asdf"
   And presses "Ok"
   Then the file name is not updated
   And the correct message appears
   
   Examples:
     | folder     | type      |
     | Images     | image     |
     | Documents  | document  |
     | Audio      | audio     |
     | Videos     | video     |

 Scenario: Cancel the renaming of the <type> file from the <folder> folder
   When the user enters the folder <folder>
   And taps the options button "⋮" of the <type> file
   And selects the option "Rename"
   And enters the name: "123"
   And presses "Cancel"
   Then the new file name is not updated

 @Smoke
 Scenario Outline: Edit an image by <Modification> from the  "Images" folder
   When the user enters the folder "Images"
   And taps the options button "⋮" for the image file
   And selects the option "Edit"
   And performs the <Modification>
   And taps the checkmark button
   Then the modification is saved as a new image
   And the message "Your changes have been saved" appears
   
   Examples:
     | Modification |
     | Cropping     |
     | Rotation     |

 @Smoke
 Scenario Outline: Share a file created in Tella of type <type> via <SocialMedia> from the folder <folder> with verification information
   Given the user has a file with verification information
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file with verification information
   And selects the option "Share"
   And selects "Share files + verification information"
   And presses "Ok"
   And selects <SocialMedia>
   And sends the file
   Then the file is successfully shared
   
   Examples:
     | SocialMedia | folder     | type     |
     | Gmail       | Images     | image    |
     | WhatsApp    | Videos     | video    |
     | Signal      | Audio      | audio    |
     | Gmail       | Audio      | audio    |
     | WhatsApp    | Images     | image    |
     | Signal      | Videos     | video    |

 @Smoke
 Scenario Outline: Share multiple files created in Tella of type <type> via <SocialMedia> from the folder <folder> with verification information
   Given the user has a file with verification information
   When the user enters the folder <folder>
   And taps the "Checkbox" button
   And selects multiple <type> files with verification information
   And taps the options button "⋮"
   And selects the option "Share"
   And selects "Share files + verification information"
   And presses "Ok"
   And selects <SocialMedia>
   And sends the file
   Then the file is successfully shared
   
   Examples:
     | SocialMedia | folder     | type     |
     | Gmail       | Images     | image    |
     | WhatsApp    | Videos     | video    |
     | Signal      | Audio      | audio    |
     | Gmail       | Audio      | audio    |
     | WhatsApp    | Images     | image    |
     | Signal      | Videos     | video    |

 Scenario Outline: Share a <type> file not created in Tella via <SocialMedia> from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Share"
   And selects <SocialMedia>
   And sends the file
   Then the file is successfully shared
   
   Examples:
     | SocialMedia | folder    | type       |
     | Gmail       | Documents | document   |
     | WhatsApp    | Images    | image      |
     | WhatsApp    | Videos    | video      |
     | Signal      | Audio     | audio      |

 @Smoke @ToBeAutomated
 Scenario Outline: Save a file of <type> to the device from the folder <folder> with its verification information
   Given the user has a <type> file with verification information
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Save to device"
   And presses "Save"
   And selects "Share files + verification information"
   And presses "Ok"
   And selects a location on the device
   And presses "Use this folder"
   And presses "Allow"
   Then the <type> file is successfully saved to the device
   And the message "1 file saved to the device" appears
   
   Examples:
     | type      | folder     |
     | image     | Images     |
     | video     | Videos     |
     | audio     | Audios     |
  
 @Smoke @ToBeAutomated
 Scenario Outline: Delete a file of <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" for the <type> file
   And selects the option "Delete"
   And taps "Delete"
   Then the <type> file is deleted from Tella
   And the message "The file was deleted" appears
   
   Examples:
     | type      | folder     |
     | image     | Images     |
     | video     | Videos     |
     | audio     | Audios     |
     | document  | Documents  |

 @Smoke @ToBeAutomated
 Scenario Outline: Delete multiple files of <type> from the folder <folder>
   When the user enters the folder <folder>
   And taps the "Checkbox" button
   And selects multiple <type> files
   And taps the options button "⋮"
   And selects the option "Delete"
   And taps "Delete"
   Then the <type> files are deleted from Tella
   And the message "The files were deleted" appears
   
   Examples:
     | type     | folder     |
     | image    | Images     |
     | video    | Videos     |
     | audio    | Audios     |
     | document | Documents  |

 Scenario Outline: Cancel the deletion of a <type> file from the folder <folder>
   When When the user enters the folder <folder>
   And taps the options button "⋮" of the <type> file
   And selects the option "Delete"
   And taps "Cancel"
   Then the deletion is not executed
   And the <type> file still appears in the <folder> folder
   
   Examples:
     | type     | folder     |
     | image    | Images     |
     | video    | Videos     |
     | audio    | Audios     |
     | document | Documents  |
 
 @ToBeAutomated
 Scenario Outline: View the information of a <type> file from the folder <folder>
   When the user enters the folder <folder>
   And taps the options button "⋮" of the <type> file
   And selects the option "File information"
   Then the file information is displayed
   
   Examples:
     | type      | folder     |
     | image     | Images     |
     | video     | Videos     |
     | audio     | Audios     |
     | document  | Documents  |

 @Smoke
 Scenario: Move a file to another existing folder
   When the user enters the folder "All Files"
   And taps the options button "⋮" of a file
   And selects the option "Move to another folder"
   And chooses the destination folder
   And taps the option "Move here"
   Then the file is moved to the selected folder
   And the message "File successfully moved" appears

 @Smoke
 Scenario: Move a file by creating a folder
   When the user enters the folder "All Files"
   And taps the options button "⋮" of a file
   And selects the option "Move to another folder"
   And taps the option "+"
   And enters a name for the folder: "FOLDER123"
   And presses "Ok"
   And chooses the destination folder "FOLDER123"
   And taps the option "Move here"
   Then the file is moved to the "FOLDER123" folder
   And the message "File successfully moved" appears
   
 @Smoke
 Scenario: Delete a folder with files inside
   When the user enters the folder "All Files"
   And taps the options button "⋮" of a file
   And selects the option "Move to another folder"
   And taps the option "+"
   And enters a name for the folder: "FOLDER123"
   And presses "Ok"
   And chooses the destination folder "FOLDER123"
   And taps the option "Move here"
   And taps "← All files"
   And taps the options button "⋮" of the "FOLDER123" folder
   And selects the option "Delete"
   And taps "Delete"
   And the message "The files were deleted" appears  
   
 @Smoke
 Scenario: Rename a folder
   When the user enters the folder "All Files"
   And taps the option "+"
   And selects the option "Create a new folder"
   And enters the name: "folder1"
   And presses "Ok"
   And taps the options button "⋮" of the "folder1" folder
   And selects the option "Rename"
   And enters the new name: "folder2"
   And presses "Ok"
   Then the folder name is updated
    
 Scenario: Select all files in a folder
   When the user enters the folder "All files"
   And taps the "Checkbox" button
   And taps the same "Checkbox" button
   Then all files are selected
   
 Scenario: Exit with "x" button from Select Files option
   When the user enters the folder "All files"
   And taps the "Checkbox" button
   And presses the "x" button
   Then the Select Files option disappears